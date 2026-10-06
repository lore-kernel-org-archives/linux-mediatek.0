Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31248CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=; b=PHXUIMTK9tdixZ
	SWL9xW2yUpg5t1cf6Qw9VodxepWMY4X+jHF1KqDujgkbX/6BEAMY/JrdtSEUanRyrKHM2Jdu95R5n
	MrHOpNoeaYd7WYGXQJk02+qzlxq7roVTrJJIpycve0lLit4DVijlDE7PsltUXn4IZ1SU+B1PvJEMs
	oWj6j5PKE9Q72TePsH+SbM9mv2EeuqV5VHy0S8PcvwlQyBIzoENbzn9qVjoTY59MsoFNh1CBMTrqS
	UlT/ThLiyZIdPTsuB+w0jhjehD0pUfakbmGsecoHNzcPwMucZ6QcQKhrNXsBOqZfPkH3cYlQUqfKO
	q8vfGG5/6RhkONv6rNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyt1-000000008wP-3kK3;
	Tue, 06 Oct 2026 06:42:51 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDysz-000000008vV-2his
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 06:42:50 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-34ef8f66a6bso327713eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268968; x=1791873768; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=Xa5rp7Hbc3maecxvlh3UwBIOikX/Z6yUNQu9ulRmCaa1rRP8ByYu4QoVc7YCT0yC7F
         Q1191hLQ9FQISt7Q4F3JpSvsaHYP+92YnWY6Rult66OmdPC2Bm7vy1db6tBhJp7suh5U
         SaoE8UBavJlYCUBVs3lCrE/Rs1Z/RJGJLJsgKFzj3VwG4vfv8RA54Q8fz11JIabaoKWa
         DQs2QEQ+divs4UKy5rIcQ9Bu626il/pdV6Du44mesY9+veBGyPmj1XYwAr0I0yuudwGl
         Hep6KYo4KbJbLSProin2JcPcsZ0R30ktBmIWe0V32uFyJvejo54FYDEaashb28HdA7aC
         +PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268968; x=1791873768;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=osBY07YZIJhnrTpVgNo7ol7FlUMkmepHcA9Jch8V3+he763RHAWjM1/Y/pQZpAG+Q0
         HH+BzKr5xjKT+0N/w47X2owCAbX1WlV3jlKe/HG8ouFGXAM2pJR+FSGghXfj+jkHp9Cg
         Ferf7eeDir1fPPw3ygBMLKuRyt3AXxNJr9bGLC+2DA+9dNpw1SMr7zWDU5mRwO+ngQoh
         ZGajqu+LjiFOP3m2RfzEjx+149mkGOTwI82INlahhL3BpH+2hjpEOeLWjaW//rcnE/9p
         0itRsLdoEOiMK44v+njw/d1XrvAqDQpRlPM0IrUK7ApgupBMRXKYIg4vArdHcXY0VrtL
         aV7w==
X-Forwarded-Encrypted: i=1; AKwUvBxNK6ge/O4VM/ylknLi0hVTiuItFk4Z5hhLVK6N7n/U9e85kl9oAosO0Zu1rns3Vc9N5JtJN3vEN2pjUcsSOw==@lists.infradead.org
X-Gm-Message-State: AFq9FYK2V+FlsHUEMwupBKQh9QqqRT4onDgvxG0Hymrv3dhy6yZiwY/K
	jVmK2tvDxhU42R1JzbxlRG6OmKBDt9/9UMbSrp/p8Y176xDyhoICcbCA
X-Gm-Gg: AYBFou3Ja507L7taeQDrwCeasx7WmOMx7eWJ0XNXey7An4x1lX+cuOQcMvq0p0fGEzz
	9nAr8o04GQcHntEZIl7NJdbC4yGduixADmaxgxE0SlM2hukFwy8gOJusWff0HfQS7qH4pF+oz8v
	G5RSq0VAnCNMaib7+xUxczTlj/EqTVf2P+Wp+QOha+OmR9p+H1fGRPE7PbsehbTkkgg193UtWsp
	I/wqP5D38HGse/OhhaV9j+XmBJri9+f1m4kPIn9MBlVrkIgBaFRpMABqmJ6yYvmEVxnsXz8GPmU
	G4gP8URlwS5FEOsaz3B8mNVt/eGRosa0E3NY0526+KnxoXS2Pm2/LHhxUEJc0/qnS7/MT6en6JY
	becBnZpI6960FKKMMmFDhKohLI5qaZSztuABg2Njm9/5egp8V2xgG6j3fFB+IDjWapCjOsSMB5N
	iT3M/A+dTyW6g37CaMfX3stfr3TbSobWTMGysIRRleZ55r6hw/yB1e/Okkz6kgOk420Qzp+aTlG
	+JP7SDH
X-Received: by 2002:a05:7300:3e8a:b0:34b:fd9e:ad4f with SMTP id 5a478bee46e88-3514e314fbbmr452029eec.22.1791268968324;
        Mon, 05 Oct 2026 23:42:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:47 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/2] Add MT7629 RTC clock selection
Date: Tue, 06 Oct 2026 14:42:22 +0800
Message-Id: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTvYhpA2XkW6mMSpHbBRJlECp
 Xc3unyL/3fIrMIZLt0Oyh/J8kwNw6mDuFK6M8qtGUxvXO+Nw2BxK6MzHrVEHO00LeRtGChAa17
 Ki9T/7zo3B8qMQSnF9Xd5SHpXTFzLeaNcWOE4vjjXKlmDAAAA
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_234249_677176_F04272CF 
X-CRM114-Status: UNSURE (   8.98  )
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

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

Add clock IDs, the /1221 fixed-factor clock and the RTC mux to allow
selection of the approximately 32.76 kHz source from device tree.

---
Chuanhong Guo (2):
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 7 +++++++
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


