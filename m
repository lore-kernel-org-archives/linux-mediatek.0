Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01626C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 14:49:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A3C20739
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 14:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A3C20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1VGaXvqF4mhnaTiHil40CXw+d9lzkgfRHI20VPfM5OY=; b=JwlEvOfpy5gzQTDCRbFijOecX
	/sXOH+96HYSbG7rxEJ6wfAg8eNpp6vnOqa0YegnENvULI23k48tf0m6d5/friH//L2wFP2ryJUWBF
	VduB+YBC/oATYj/PpI1pUpUeYgo9B2pFRHKKF4+Re6Sn6hmNSmaeV979EsokrR/Ba2/CtOqRaKyej
	yqoGjt7RfDljE8gNOUpgnhRySCaWlZx8SUc2Q11HcDhiYmBbEVA1bmv85gbHTSGdgOFOnLB4SdvYM
	JlW3YGC4p106gWKBa8dh3FA15uO+oylhHgDvXAJFbnOh8HDEZDNESxf9Jul8999UCsYS+1HTCXoeK
	mtco1ciew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzKzM-0008Fk-8r; Tue, 12 Jan 2021 14:49:40 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzKz7-00084T-J6; Tue, 12 Jan 2021 14:49:26 +0000
Received: by mail-ot1-f43.google.com with SMTP id b24so2498911otj.0;
 Tue, 12 Jan 2021 06:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IWLlMkimtheXRJNfeaVYATyzETTt3j5yVq4Hw+rVSck=;
 b=ah+WfhQGYvbz56I9WZiPo/SJSR0AfzPlXvaIoyi6RKpDRSuz/E+rgpgyk66f4fUdOe
 qPiMcdxQXHz47ya/OQCZ310sTLDwMh4NyHj7z2+64AFm51GFMLYKnaPdR3uIpQneHeqy
 gmpplOphDTDTqQNtk2gX5s8MEHNNg6xbnIELCHHS9tAwwEpdGzoIMu6TQSgOIOa3xhX2
 VQiFRpLeOdtXDvnuIZGmT9JilVagfe80IQJ/xbL/4zlKXzC4SAt4e46N6jRQJMhCfUuT
 cnNQ9wBAl59sOluB1eI/7Hmx2yfEgDjCANkRIkGEGH327aWIetGThf87E0LHPmZx9Q9a
 HO0w==
X-Gm-Message-State: AOAM532JEPunhdZFghR4QXRwHpfTGDMJI4OZNaMoZ37xH5CdaxtYvY8W
 4HBI+NtJVCjjPApmteUFNw==
X-Google-Smtp-Source: ABdhPJy/6PT7DRQYGCTDug44TC+HCUic82SM9VAH6YLosWT87BKziW7GDMmDCgyuqvhV6ddUJ7BRzg==
X-Received: by 2002:a9d:4b19:: with SMTP id q25mr3080599otf.124.1610462963625; 
 Tue, 12 Jan 2021 06:49:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m29sm607648oof.20.2021.01.12.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:49:22 -0800 (PST)
Received: (nullmailer pid 330261 invoked by uid 1000);
 Tue, 12 Jan 2021 14:49:21 -0000
Date: Tue, 12 Jan 2021 08:49:21 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v9, 01/11] dt-bindings: mediatek: add rdma-fifo-size
 description for mt8183 display
Message-ID: <20210112144921.GA330210@robh.at.kernel.org>
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_094925_673368_E2A316A6 
X-CRM114-Status: GOOD (  11.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 07 Jan 2021 11:11:11 +0800, Yongqiang Niu wrote:
> rdma fifo size may be different even in same SOC, add this
> property to the corresponding rdma
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
