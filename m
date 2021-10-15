Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 21:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AA2561108
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 21:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AA2561108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENs0j8QHCGmSaWPNIN4kO/Q9q+cH3+43/hrlKDhcU0g=; b=yCsF411hopefd7
	AnuV+tEUndqWCK+mDVqaUp4bdwrua4VO5ARzU34dZojDE3aZuHqgkFIzlmZbsDnQEPqyJAjz1yo13
	vb7+Xh4KgM4wnNHAt4WVf26AGxoR1hNIxtoLQuEcp3vCzjoxaynbzyErH5orWt17fYIUP+o9wkf/Z
	0OABS6HRSrUOpgvpdu00pSfCAm+UNv/D/8B1AIy3wy4oyJLvQGwb5BwdRrHKrlS0nILDG7KWOdmWV
	34BiT7cPd84wdfwJM7+y/ijqc3yqSRkscAEOFZK4tAadCdsGeUJm4dPe+fZaY/FYhVUbE439lay2B
	d55vgdSWNoRkO4OeXIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbV1G-008qv9-Mk; Fri, 15 Oct 2021 21:45:38 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbV1D-008qtV-5J; Fri, 15 Oct 2021 21:45:36 +0000
Received: by mail-oi1-f174.google.com with SMTP id o83so14975735oif.4;
 Fri, 15 Oct 2021 14:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=NYOyme/cinRUC3bVzCpIQa4360myarzWLY66zGOmnyw=;
 b=vEhpG0C1UAlsDeWtqXZmeSJ5MdQW9jms9gqKUyRmhLlpD9z4UCAJt/r2xEX8HgQW11
 QHVA4LGW5edd4n+A58c/d+KtUUbpZkfIsYtEDwGzzBzAwsvlepLh+hy6XVBx7ZTdTXbc
 fvDW1aqKHe+PkvQYu2jyTlYyFow4f0Ueo7bq6arZ1V8wPdvfxXlbxNB2t5OGdSOWl9yP
 a7BEI3Ya6hQQv1N0EYylnvMsK5/RBIq+eb7NDgMRTHKUnTfuA6YRqc2rMpFPabQzKcMy
 HRTTIS9pyeVWQeqmRE6F3nmvFHDsj/V5MsyiSY8tuA8yEFhdbImMntDsB62u7s7csCn7
 nQJw==
X-Gm-Message-State: AOAM532cUyyHRFYheo7X78/jDNC4zRjkrmi/lTm7vFvi10Hrv5bu82jv
 7vKZ7UxvJuCBuluitlLk8A==
X-Google-Smtp-Source: ABdhPJyxArKeXBHH7sHkPc47Cnex9p1URhiMiWu4n0F61RgItK1JWSN1OQ8mY/jCwu8apIz9fTyk1g==
X-Received: by 2002:aca:d64a:: with SMTP id n71mr14261693oig.40.1634334333530; 
 Fri, 15 Oct 2021 14:45:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m7sm1261843oiw.49.2021.10.15.14.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 14:45:32 -0700 (PDT)
Received: (nullmailer pid 2254012 invoked by uid 1000);
 Fri, 15 Oct 2021 21:45:31 -0000
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: acourbot@chromium.org, srv_heupstream@mediatek.com, pihsun@chromium.org,
 linux-mediatek@lists.infradead.org, Rob Landley <rob@landley.net>,
 allen-kh.cheng@mediatek.com, randy.wu@mediatek.com, tfiga@chromium.org,
 daoyuan huang <daoyuan.huang@mediatek.com>, linux-media@vger.kernel.org,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, sj.huang@mediatek.com,
 menghui.lin@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 drinkcat@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree@vger.kernel.org, hsinyi@google.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211015123832.17914-6-moudy.ho@mediatek.com>
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-6-moudy.ho@mediatek.com>
Subject: Re: [PATCH v8 5/7] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Date: Fri, 15 Oct 2021 16:45:31 -0500
Message-Id: <1634334331.594718.2254011.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_144535_211279_4C256961 
X-CRM114-Status: GOOD (  12.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 15 Oct 2021 20:38:30 +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,ccorr.yaml |  59 +++++
>  .../bindings/arm/mediatek/mediatek,rdma.yaml  | 211 ++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,wdma.yaml  |  70 ++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  68 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  70 ++++++
>  5 files changed, 478 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml:211:7: [error] no new line character at the end of file (new-line-at-end-of-file)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1541634

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
