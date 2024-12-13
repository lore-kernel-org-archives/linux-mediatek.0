Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60CAE7717F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHzjLDekd5mQV8SYfeuvwYKyGO1BHWQrWxmHdBR2+PM=; b=xOclItCvb030Vy
	G/qnZOvwEL0dQDLAgpuYy2S81qacHL20yezmzXjmay8g7AIrb8sWtKmgc7IGVfSJIZRaW6rhM80ev
	Ptb1UOF+7NQ8Tyx4JQzMnnCmSD/EkvHZCYOycS54VfqfrhwkrkZCPOboUj59tmYxgTAZI2zLtz6wC
	AKq5oeowQ+rtbJ+BgD3tcBCiVMOazO1/C4Yfdh3ci+VtTtxUxsdDv7MmCtRHag8gS/k+O3aN8uFpu
	/W7PVGw9oV/1YyyH8zCPwD9EaKoDf/zexYo5DoRqMdUwPVQ+jVPyTu0eXwk7Gsl2r3kq4jxySb81F
	xxteffpV6vD2h0xd2BLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyEq-00000002ltm-3VkN;
	Fri, 13 Dec 2024 05:29:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDQ-00000002la6-2DkY
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso1572489b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2024 21:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067671; x=1734672471; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHzjLDekd5mQV8SYfeuvwYKyGO1BHWQrWxmHdBR2+PM=;
        b=JILmLhPlDhNaeZCFyPuNv9/x6gtbb5ZMd2ySDEzz/CzaiQO5Vdi7qLShfSkx6ufBOP
         kvqeGoyQKPOQF+NXtAMFDvWAnAi8ccRUymb6KmltCpQPDAEyLqpybpGLQClnF4QUdqg0
         Si0Jpnsag7suSqdOhEv1ZanAE9wTyCnUsca8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067671; x=1734672471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHzjLDekd5mQV8SYfeuvwYKyGO1BHWQrWxmHdBR2+PM=;
        b=M44KcuWlIdUlRKXsxUOrTADF8bZ3b7NRb/bE1+Zkr7LhMzvqfuyyG6K0LkA1+Ew/e8
         aWGzttROKxtEwsNzYYOETBpJ3qBsR3JM/IiwzYRO6dF0Mdr7jAH2L5Gmi6sqQXmIi4Aq
         D54IQtuqph7sJU2YsVFoPKmicIa/WBf5DXe5kKudWsDZnBNMSs9GE5Bm7/Gtl8fC2Vm1
         r1MHoWa1HUIJOjyZX24njranr3rSxHL2wYrfxDQViiyjXWBgZdsK0gXUZKcqDXtj5oRb
         kw2jsJ9YOwBJU6qhy7Ew8QnB1XfN5IVthJ9hlkYfDOhpOU1IxFXEFAYePWSYBaV8hRWT
         Jm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnZaaDk/dDb6OGzqqSri1/VXhJg9BymQ8NbMKmFGXIEOia4+J1EZfx0kgiwPFAwTCeAAyqg7EZZsiMph3n/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIDVQObKI7iRTRNanmJY7nI22l6Vfzh09tDeY8F/fiDM13iW4J
	bKSMru5QVpyd8qonDkIocLoL95BERJ9dTo3XrXXjsLFxTsCKBvWkSLsTD3j8XKSCM6HERz8rsSM
	=
X-Gm-Gg: ASbGncscmD0aX5//huCh9GHADr4IRWxPeOUKksnisKbJD+8YnAxSpiMF/2ZAxyBrkR5
	rT2ZCLkQIkXAzb0nEGNPzBNhBzaneeMiZOWy7gKVFWZNjki1HfgYDNkHFc1Jj28J5alElZNrLtL
	IZn2FgWFPiVrreojBs5nfzUu5k5IZ5A5P9Eil2n49wsoYofRI8d4kThyW4Wg+sDWNtE6Wj5n8+F
	DNLfX4tXTPgxZkRzPJPkjTp+hurcd0RvZJX7IhSSS2DKXdz7dNTj/kOWmAFKC8AmPne7KkNlr/w
	DWI08FzB2RE+WuGLj8svc98d1a5GXfigermiyJ/AleRg5uc=
X-Google-Smtp-Source: AGHT+IHB67SDjQZdu1KmnyQPCBhhCJuO+6RCt8yzJ21rj5AHz2vHeQnr45DTMywbF+2HqFLTeZ/Yjg==
X-Received: by 2002:a05:6a00:ccc:b0:727:3cd0:122f with SMTP id d2e1a72fcca58-7290c1456b3mr1782962b3a.9.1734067671614;
        Thu, 12 Dec 2024 21:27:51 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7263803a805sm7386830b3a.14.2024.12.12.21.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:27:51 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v3 0/2] Adding second source touchscreen used by some
 mt8183 devices
Date: Fri, 13 Dec 2024 05:27:46 +0000
Message-Id: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLFW2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3ZL80uSM4uSi1NQ83bTkRJNEU6OktDRTCyWgjoKi1LTMCrBp0bG
 1tQA7gEEWXQAAAA==
X-Change-ID: 20241213-touchscreen-fca4a52bff58
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212752_560252_BA3CED11 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


---
Changes in v3:
- Split from the v2 series
- Link to v2: https://lore.kernel.org/r/20241018-post-reset-v2-0-28d539d79e18@chromium.org
Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

---
Hsin-Te Yuan (2):
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      arm64: dts: mediatek: mt8183: willow: Support second source touchscreen

 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts      | 15 +++++++++++++++
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241213-touchscreen-fca4a52bff58

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


