Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 22:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA5C61181
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 22:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DA5C61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rc4TgUdoCSw9mhagi8Pei20Z4TRrchjrE5TXw5CTDT0=; b=MDdRHXUt1Tjcsp
	djacSHLcmJbPRJ0R+zS7ZxKuYvY+lsw5YYk4XfJh5TPQzyCJi/74zMxT/jRM3CsiHziQDfP5+IPBk
	568fr5Rt2W4Qj95vH+J+Y7KhjAgxmPFC/PEzkCyuGsyruneQECpqvNlp5xU4yqo1d8dQe7V83I8yA
	ARdAxBtzSg+NAQ+YssW22gCrMzx5/hk+gpx8Yskd9J2bT+E7xu2pdk9k8IwRI9Z3ff0IbIDNIL8Fs
	ObrrVINqnPdChN+OBNOTjP5AEdYfN891OE5deD64pr89V01O6KzN0PQofpstMBZ31yD3zNXDWeF7+
	IwdqXAy+qxapDmD+ArGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnq8q-008zjf-Sh; Thu, 18 Nov 2021 22:44:28 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnq8n-008zix-Nz; Thu, 18 Nov 2021 22:44:26 +0000
Received: by mail-oi1-f170.google.com with SMTP id m6so17674911oim.2;
 Thu, 18 Nov 2021 14:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rjpsRWH0PgCRL7LwTN0EvynoHBqTaDIG3WDWt/eAtH8=;
 b=aQoVQHiPzKIwQil6Mm0rfD8qiRgZtDeGVpuTnpPCQiqEDNiupahhcw33N3UXhLapmk
 dtFJQNatMh2Ef6d+6Ge4qEZvlQTixQjSlDuUZK8lWhlgbK5EsWxrFQpnAn+acmWKriRB
 wdkny4UZHTFThesfb0Um7sEi3pm2yPKrbFqJm/YbvHlU1/7kddXnQosm8EboYSprrNSj
 ewHY2IhegtvM7ybrkeI+ICVVel6uTfY+DVg6RWdxlCmJDBmSt6EsCuaHJS3pRrL+5zpJ
 ZiremhRenwAY+1FYrlPEUCpJDx3x1lmUVDQglsLIHxsnNlT81GiQgqvikA4Tpv+HEQgN
 eKYw==
X-Gm-Message-State: AOAM530sSfHFEHMzNDOug6Pu7V0EDjwYhGeRF9tPF8elPHZolij6FtDL
 /nRqRnVO0hGqoxB5rzc0gQ==
X-Google-Smtp-Source: ABdhPJz9o1M3WHv7KjQVL0KDh9BGiushajnOmQnCXcreeffLUqnVVIy5EypxfRlZDi8V3by9rxcCMg==
X-Received: by 2002:a05:6808:218b:: with SMTP id
 be11mr570075oib.80.1637275464768; 
 Thu, 18 Nov 2021 14:44:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o19sm315375oiw.22.2021.11.18.14.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:44:24 -0800 (PST)
Received: (nullmailer pid 1898132 invoked by uid 1000);
 Thu, 18 Nov 2021 22:44:23 -0000
Date: Thu, 18 Nov 2021 16:44:23 -0600
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <YZbXR1Vy9CHhsg2X@robh.at.kernel.org>
References: <20211115042030.30293-1-james.lo@mediatek.com>
 <20211115042030.30293-3-james.lo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115042030.30293-3-james.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_144425_802961_FC6AE8D0 
X-CRM114-Status: GOOD (  10.52  )
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

On Mon, 15 Nov 2021 12:20:28 +0800, James Lo wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
