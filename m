Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE351CD4F57
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUFo6hIuf2ZxDrSoEBKNJqzPv5wXEukq1eF4NrWaHmc=; b=RFGiHQHX8sO9Pn8LA3eG0btGry
	LWZpWI35/ZCR/NNLG0Vl0OJTnPuFMJ40TnGoyXMyyzK55AaJY8foJ/3EbY5XYSArYjdvDo/rzQrku
	sJEqxAgj3x26opvlW6TyAYRcF3ttPVh8sC2W2Ybng81KJ6xZ1MJk4+Wiaqd5zx1s6msAs5sfciDu4
	rF5IsnmOOn/lRHCywpaJt1clqsMCNhmPFQeIQ9ocYHWVJAtalDKYPxcqrmLzbht3PaulpV1v8T007
	DUonHg1GwgAo9GDXUoZiyRYFx/bUxkM+SzaQ7wG5ucGyo2dHoVEtO72lE5fTroNG46eVQ5WVmLk32
	+BAAKzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI58-00000001DiJ-2r7x;
	Tue, 19 May 2026 10:53:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI56-00000001De3-1aEG
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 10:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779188023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUFo6hIuf2ZxDrSoEBKNJqzPv5wXEukq1eF4NrWaHmc=;
	b=YxpCSbyuPwMlNtCs150nMYggIGLfxv0JG1L1pCrd+eZyvNSbO1rZHlw4srcU4GrBC5sbzc
	ejVFGyP3AImR19yBvNWJj8LSMzFoCEkJHZM3dpy0UgDhJ2XtYvD0Qxe19PXszy26eLYeKu
	u3t/f3g+YqZpqIP+TUrlu7KoSniHjD8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-Yk4X41rBN5eyTc7sXTNoZA-1; Tue, 19 May 2026 06:53:39 -0400
X-MC-Unique: Yk4X41rBN5eyTc7sXTNoZA-1
X-Mimecast-MFC-AGG-ID: Yk4X41rBN5eyTc7sXTNoZA_1779188014
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48fe40b61a3so25250085e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 03:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188014; x=1779792814;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUFo6hIuf2ZxDrSoEBKNJqzPv5wXEukq1eF4NrWaHmc=;
        b=AsTbZ9jDQNvUGfXu6gukrQfSK4/HkLWtDSmbwvfi1b63ytyz/Oc/KDxzlxRVwQa0Ev
         L4m8Xvnmc8svHCyzQSzkSWFVtVDG06SHrdAkp9dnxU8SrR1ls4ThrD5qXVg8xwcv6C/s
         2w7hPwE6TheMr8ge9kn1Mx3VEwQk04gtHTAU9fqHHgXzK23dEDxBNMXQ125qpHVdlaBM
         greGJjJlbwQhCiQmIkqAT/O+yq1c7uffYIqhra7/dFULNSOpjezSudn6UH5VNvBUpdsY
         a/I1xCPo0hoJmVbVzi1T1TYiyQOY1M13xWmeRf36uSIUnrg8NFcHg6jS3tfV7rcI4kQ6
         ZGzw==
X-Forwarded-Encrypted: i=1; AFNElJ9k7X8v7OTlZKhEG1ajzP7QJNQjzjvFNPEwz+9YT8SIgFXDxChVecC/chjOTUaZPitm8ucwThLt/qbudxxv8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YznvCGLgMyNaBL0beC1xplruv9v7zo1ONx/GHt9KA9eqHOfd0mA
	QHf9Fs/qPZWMbR6AFkcLiN+8abK+Ciffgz2nCdCD+fId+mribKhrfVCbtbuXs4dtVX4a222uab5
	YSo1mqaoULvGMP6jltvpuCEhLr3xwWHD22cTK/dLJVSsTfsFQGza0tb02qHP4Ryxt1VEJz3Q7Qg
	==
X-Gm-Gg: Acq92OEx8/jAiD1tZabCIbZcHPFEAuT4xTexSPrHTnTE8k73OThE9iOrI9KlXw6x+Zl
	+xIRs/h4q4U4BaJNKtKo2TvvU4+RUSvQSCSS/Qd/QZ5EXjp7s+j38pIrbW50NuQuS54Y4QSuMYJ
	uVZSwAFA1ep77SgPriTTwawDQ5rfTerb7TdGGGL8SdIMq8gYWsRZmEu/QZxsVaRpy508L70WOUw
	8GajhlFr+wIu8m04LimOKXlO4C5UVH4vddmJ0O7kau13Kpik3aKxQU10cNDFik1k/myY4zpW7KI
	mFtWdTPtYGPFg9LCBflROairRjEyavUBwuUNDyUJOVYkJYD4XmG1HKUJQOcKbdYdy5GnkQ6FETe
	vjVFqt/PKElzhbne3/2JXMpZYr/RwzXqEnWaMPRn4PM3vzqFYJIaiRXR8kctUfvVaVQ==
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr282542425e9.21.1779188014449;
        Tue, 19 May 2026 03:53:34 -0700 (PDT)
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr282541945e9.21.1779188014000;
        Tue, 19 May 2026 03:53:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe78aadsm101525975e9.29.2026.05.19.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:53:33 -0700 (PDT)
Message-ID: <3a390dee-38e9-4df1-a94d-7128cd4eb834@redhat.com>
Date: Tue, 19 May 2026 12:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 4/5] net: dsa: mt7530: clear flood flags on bridge
 leave
To: Daniel Golle <daniel@makrotopia.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1778766629.git.daniel@makrotopia.org>
 <cc8d2f494dd202304a6f68332f3a90ea0a8a4618.1778766629.git.daniel@makrotopia.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cc8d2f494dd202304a6f68332f3a90ea0a8a4618.1778766629.git.daniel@makrotopia.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JL8Q_DcRz_K0rDuPyerEnAItxRqvz96tJuIALG6ZzQY_1779188014
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_035348_483970_7D8E6E65 
X-CRM114-Status: GOOD (  16.86  )
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

On 5/14/26 4:05 PM, Daniel Golle wrote:
> Flood flags set by port_bridge_flags persist after a port leaves the
> bridge, causing unknown unicast to be forwarded to standalone ports.
> 
> Clear UNU_FFP, UNM_FFP and BC_FFP in port_bridge_leave so that the
> port returns to its initial state without flooding.
> 
> Fixes: 5a30833b9a16 ("net: dsa: mt7530: support MDB and bridge flag operations")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: no changes
> 
>  drivers/net/dsa/mt7530.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 752ba92b0851..5b58e42bfda9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1767,6 +1767,11 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
>  	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
>  		   MT7530_PORT_MATRIX_MODE);
>  
> +	/* Clear flood flags so they don't persist across bridge leave */
> +	mt7530_clear(priv, MT753X_MFC,
> +		     UNU_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
> +		     BC_FFP(BIT(port)));

I think sashiko has a point here:

---
Will these cleared flags be immediately overwritten by the DSA core?
When a port leaves a bridge, the DSA core's dsa_port_bridge_leave()
broadcasts the DSA_NOTIFIER_BRIDGE_LEAVE event, which triggers this
callback and clears the bits.
However, immediately after the broadcast returns,
dsa_port_bridge_leave() unconditionally calls
dsa_port_switchdev_unsync_attrs(), which calls
dsa_port_clear_brport_flags().
This explicitly configures standalone ports to flood everything by
setting the BR_FLOOD, BR_MCAST_FLOOD, and BR_BCAST_FLOOD flags to 1, and
then invokes the driver's port_bridge_flags callback.
As a result, mt7530_port_bridge_flags() processes this call and executes
mt7530_rmw() to turn the UNU_FFP, UNM_FFP, and BC_FFP bits right back to
1 for the port.
Does this leave the isolation bug unfixed since the register clearing is
reverted before the DSA bridge leave sequence fully completes?
---

Since the other fixes are independent, I'm applying them.

/P


