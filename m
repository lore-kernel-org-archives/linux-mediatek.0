Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C47C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=; b=K3oAjExk5ta2roEWbR2MCzflHC
	kN6DAqME03Di5aMwR1LakOZmkNb3Y7a5TU2qhMyY6bsVFZiu++2N/y1O6p9t6vX/I3gA8bg0gpbNj
	qXdewn5bE36m4CH6/dxNVJtbR7boMbkxikq+fzH1YVuZEQ54YDr7KiNrfiIl7GBbCg63kVdVj6dpA
	7BAj9Iar4iA10yIIYC100KPfAfKc1LAxoQWjUZa7gW1ctUrL0Ujr1TuGCJBwe1ZejQ+/ylqVp7+kV
	ruYLS/lKU192GGmTXN6kQfZI/647oZIPeI1Y9z1hJra+QLoiIIAurliMEm8gDPZ0onjxyf4Zhanfn
	wTG7yopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEw1-00ADNf-2T;
	Thu, 11 May 2023 22:38:53 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvy-00ACwx-0m
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:38:51 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33164ec77ccso615765ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683844730; x=1686436730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=T1vTFJ3ph99/mqUWGDMVcpfXAbah9+ScQlqestniXFMUKxb/wBJXUihnRBnrW8Uv/0
         fH6z8fhjj5Qi//2MHMdRmI2TU/wfhwAZt+bYCGUiuVSA81j4VTQt8VPWsdO8hm8Zmc+w
         AiGP7X43ltgvRm3sW0GR81xRNeT0x52IapZ4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844730; x=1686436730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=b3Wu0EdXu5QpfPz2lUuPK5KdrfDFbR1YKuOv5ALVpES9tjmh7qBmOY2X31wSYS30t9
         87hoywRSaiqs0OgY9gcz/SVXKrSs+WHZwNaAaBXvHdrf6tMtfw+1/TyHNmkkHGxOn0ZT
         GVriotn1AiH5AOI/umS3d2uGqhE0eg6rXsA9JS9+A4z/2TWXJszTswZ0Pdpavsa+UhuQ
         QnKYAYFWIlLSiL0yo+zFu+6heIXdmiFMollIvqPEuV/Gt+d7M8zLCHmjB6R9wZhkX+QZ
         6G8lHFYxK9FxIWQuSq3dIIbqMUwz5tSWP3tQdgWfeSr8/qi1A/Fwdn/bycSfnwWzZmHr
         kX2A==
X-Gm-Message-State: AC+VfDxqonNYiaKMhbh9jgIQWfeSudXIUimtRAwtzKCUHVCJ3gp1Zibp
	LMxpUAiP50d8HH+Qth3EFxdBlV9fdD5FqyqoJ3mPMQ==
X-Google-Smtp-Source: ACHHUZ55cM9yUB5qvcLCownXmJR4ded64n4jlcjav+0Yl1WBeP+3+qojcZXIibi/XadXetaKOEAesxJFvJnVuF24v9U=
X-Received: by 2002:a05:6e02:174c:b0:330:eb79:91ad with SMTP id
 y12-20020a056e02174c00b00330eb7991admr16655ill.9.1683844729878; Thu, 11 May
 2023 15:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.5.Ie7e600278ffbed55a1e5a58178203787b1449b35@changeid>
In-Reply-To: <20230511150539.5.Ie7e600278ffbed55a1e5a58178203787b1449b35@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 11 May 2023 15:38:38 -0700
Message-ID: <CAODwPW_0s=9Ek3bbsmgvNN0T4X-76k-Q9_wjfCHDZ+441xAVzw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8192: Add mediatek,gicr-save-quirk
To: Douglas Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, wenst@chromium.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Ben Ho <Ben.Ho@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org, 
	Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153850_295194_F98F9B22 
X-CRM114-Status: UNSURE (   4.95  )
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

Reviewed-by: Julius Werner <jwerner@chromium.org>

