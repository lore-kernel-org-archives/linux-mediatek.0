Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5393C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=; b=BPBPsQ17Zf8GFhrPPFPnZpV+rT
	PMTwyMRgtw9zZz5lHSf62ADShi1oMtiS10v4ABWhvcycr7kqulycatbsYhXq05jxDVq19mbCEYESt
	P8LID3tweQe58UHcbrYNs/IxCvBETdj9Pk2KVdkmc1TklDrepHMJVwrcThERvDfutzWfDTnKtFkV5
	JN6N5yqrKNkjFZLlvw5gGhz1MhfxqLJGMHEOdsgdDgl0T1f5ekUlmKthR1jEZN67VGzwaMMVsaIKv
	GrKWuBYY1zIba8STnGLu+GomLu8eLZsT245fTIxhaY0L2fvVZoONUiAWbah8IPobNdlEd06f4Ke09
	b5H0zRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvH-00ACyr-19;
	Thu, 11 May 2023 22:38:07 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvE-00ACwx-34
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:38:06 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33164ec77ccso615615ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683844682; x=1686436682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=YB4CXa+7IiugZFWW89TQYuVh4HnN1R5IuqF1PWtOFnF45ocw8Zs5UZ19l2DrlhDrL+
         T91s7cNeQp8tLalUmv3BhabCypP9bH6PNCWWysJtJxUfK51iS+unG76XmPRzg+WR9sQw
         +tTzIYC62rYbOgdKq1mzzYyCN9NntV0GOt2BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844682; x=1686436682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=kYOS/VbgQTDSxjBCqbN94w8jF+0ujNQxtVAvKQ1GFYQiWpJvti91uBJgRLyq0p5kEk
         WyEwlIjUpPpv2zoyHNwpOeVmdAsZ9YMcpqw6UDo4bn/ZISrAvouwDpLkjTuug+M9kU86
         4Ea3BPPRvjT5TGKnPEek7cDREKgCdcU//RnjGCmkQ88Ar7Ea/agsIbF4y0ikYb7kdXxe
         Lpqn+1ef0Zh7B7bhEt7mScRAb/BLHllhuZrbwT4d5E3KKSLWUcvJdxZYfRfhkW+VcsZk
         w+eLylF3UdTgyQWOOwcVccIrx7iFxk9ss+Xabrn/ERSZKfe9SCpInYEZz22/J/6g9cQp
         sHSQ==
X-Gm-Message-State: AC+VfDw0AIEr+qLHqEBMBlNmno/JFojoog01saFCEGP1TdXzk0wS3aqV
	Ium/XYOWU3ccA1wSMSt+IaDcksjQJ2I9fE/C/i7kzQ==
X-Google-Smtp-Source: ACHHUZ5aB1JvuSw560zhv65bAiwvIZNHMbaJ3VG5IwoL/nVaGBX1hJ51wet8Wz05aOV+TMIKI+1jpET5bN3nE0PPhMc=
X-Received: by 2002:a05:6e02:1ba6:b0:331:4d3c:db55 with SMTP id
 n6-20020a056e021ba600b003314d3cdb55mr122778ili.4.1683844682395; Thu, 11 May
 2023 15:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
In-Reply-To: <20230511150539.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 11 May 2023 15:37:50 -0700
Message-ID: <CAODwPW8TqhArafCK3RvBdxyiav3WL=0MU6x=QyBOFP-h8bQrWw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: interrupt-controller: arm,gic-v3: Add
 quirk for Mediatek SoCs w/ broken FW
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
X-CRM114-CacheID: sfid-20230511_153805_017669_15B0A854 
X-CRM114-Status: UNSURE (   4.96  )
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

