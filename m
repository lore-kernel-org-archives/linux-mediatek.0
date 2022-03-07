Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B6FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qncq/lSGFdrZwCctpvu5PvP+icSls5qDqVdd49R+puM=; b=nv3owusApnT+Rg
	MlO8xJefT6pWaJnOBn3ROP+LkqkNUB1/naclbVF8KMq+gOl1oVDA55Nl76QukDbSXZdXzPj8pA3bL
	90VC045+KLtg0tNoWrOyvqwD5xyR2SU3u5XRwho1tc/BPoOwp3BONipG3YIwBcqQ/S4cvK/+Th9Ao
	btKmwg9a8IqeP9ypokr6pOLjSg2YBFRQO6yduqWeHxfl++zZpyt69QSbG3KdR2iahz33yD47QLWmG
	HixoTzlla0hTCiIjF3v20tlWQFuHSXpVd2LF9vRZrLj7RQ3jRW3OUdpai4UFEUXZa++sF1OB0+8fR
	qJJ5JZ0S4jqu8nBlESrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMOj-001tPj-NI; Mon, 07 Mar 2022 23:04:13 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMOg-001tOp-Tj; Mon, 07 Mar 2022 23:04:12 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so4194950otq.13; 
 Mon, 07 Mar 2022 15:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4E9eRweUplMzQvU1VSUF8PEGvHk+pON6U7CEEhUI86Y=;
 b=sLTaJrM76WsaE4b/ce9iiqGqO5/foSECyQgFSbdiAViekm7L9gOaCSqMIKDY87KFJ3
 DrpKCASyB4dNVTEzlkpLamMlQY/JbHBP2ZY42XufZ2l36uaUNsIUedpeEshR4U8cZmzT
 bmf9wShWHfZ1wwxXMyRArNfvp7UA9zt+a9MGiK6PfGTyF4Rf7/FTnPwKAIO2QG/ftME3
 HyCkUNHplhfNFystLBENbJro2czajKQ3BCEAJUi9XikabyT81A5gw7VP+1rZPiRPjxTp
 RH+cfiwJxGrPE4/q7pfqogoZe3aQYYWDhwL/15icagf2mmsCRG1A1KU1D7Hc4iBYeC2a
 VRbA==
X-Gm-Message-State: AOAM532u2tOBP770MYq2p/ZZxx2jTbpnA48Zfm2Mk0fkAzDebIshwSy0
 p2NBc2d1aB6JXe/oYdLWnQ==
X-Google-Smtp-Source: ABdhPJwnRiwH1OmVRJThFCgiwfgEMg7WN043TMcx7tqaSeEny0pEoEWRHNdff7N7BXb71XSzJp4iNg==
X-Received: by 2002:a9d:462:0:b0:5af:9183:44bd with SMTP id
 89-20020a9d0462000000b005af918344bdmr7033688otc.21.1646694247151; 
 Mon, 07 Mar 2022 15:04:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q62-20020a4a3341000000b00320f8a179d0sm1480227ooq.30.2022.03.07.15.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:04:06 -0800 (PST)
Received: (nullmailer pid 3424006 invoked by uid 1000);
 Mon, 07 Mar 2022 23:04:04 -0000
Date: Mon, 7 Mar 2022 17:04:04 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, daniel@ffwll.ch,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, yongqiang.niu@mediatek.com, hsinyi@chromium.org,
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND V6 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Message-ID: <YiaPZGzf5F542nZb@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_150410_979234_863504B4 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 03 Mar 2022 14:57:21 +0800, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
