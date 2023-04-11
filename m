Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB14CC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 23:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM8PNDHiM8fHyWmRYtIDydQ9V3GrA9VGsex5qRTzOK4=; b=h/Z9+rxEbNpe4ZjlJO/xQsP3iV
	kZNsZUltvHdsZg/mxAR4JGUN9NkJtuCzu2Hq/ii17k6VzsdZhz3uaq2wmc4qUvvQg3Mj4xI4TwB87
	R3BClby3CWH5yxu8Ed6qfGfueiYtGyn/Kfmkj953QrxZanN6LxQKOfFb3ZOhOV5SCzjLE9xISvBv3
	6KP6JlEwGfyl33HkSykcaHGCu44230KrsWRS3fTyARtOXWVHnzE35VnW3N8XfNXZoxoCwvdclM/I7
	1FvIHtvaVgObjo1qjq4+ZG/TpqijY0UTBhMWMDDZ5oRZsfUJTEc58o465nTaBJhxhrevX9K69fdCv
	KHYZXPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmNsA-001PUF-30;
	Tue, 11 Apr 2023 23:58:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmNs6-001PSs-2i;
	Tue, 11 Apr 2023 23:58:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id j17so14919075ejs.5;
        Tue, 11 Apr 2023 16:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681257475; x=1683849475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lM8PNDHiM8fHyWmRYtIDydQ9V3GrA9VGsex5qRTzOK4=;
        b=Mn3BNjrqmhFvJ9pViu7F0gZeClUpFiWi4hz91d4eo/KupM2YeWs2oR0GNEJ/gVc+Tq
         HfEbjlLnREHSSuCxLXsynXB7Kbf97OnaarhGxRv6IYiEVnl2QMPrLGQYcEBD3p7QtUV0
         MPYLgWjE78/qv3vPRKeSGbYig7lwpUy72ugAzxil9vLTRowfi8oLPZ1RCjoVz58duiGg
         aHxzc4h6e0DRdtz6l3DmpJPRpl1FGyxFcZpZzupGuc023RoMjMaJcW5O5rNzl0RNSEut
         Md4FzGcaonVx0FHuG7X+2L6X+GhK4mlpuEL3PaT+uTWw8paKCrjqBXERpIzW5OVPKFYP
         COew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681257475; x=1683849475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lM8PNDHiM8fHyWmRYtIDydQ9V3GrA9VGsex5qRTzOK4=;
        b=ZTgsGO4KkfIXVjio+WIpMuZ/c4i4OGNg//RtyTQEg+WNuXiDyCqCdTlm3fxjf9JFru
         eqhqm8hqwKRmqD0s/TZjzf7St28FEXxF6bA8Q57+Xbp0AAQ90ALXtK3c4hE92OJwSvZ5
         HPvflcE1+PHjW+SiO8Wfsb2Zy3dKFiYC0KY6mKWUiT5VQaoTC8ItTfYTV3+ybp8tiwv/
         xdRJdhvRhoKy0zJd57eICcp3dRPdYaRW5LcJEvwCd7vyLiNHPBgLkPMrzSZSPD6hmz6e
         gGHOWfIh7R9xnuiwqRnZCnDaIwtv0lHYn1RDODo5PS011azJWrktJ1T6vcU/72JRDmJw
         svLw==
X-Gm-Message-State: AAQBX9fR8spufOJ+RfHivJFpQWLmiID60hcvhj4Sf5SsM3yM4gZMeyww
	WWtyG4giB9d1waZLyFmXFGE=
X-Google-Smtp-Source: AKy350YkQiw3MsY7AfwW21RPuFGBlZIrGU9UF9vXpvE2F4eHtuRwpDdUQ0Y4YJYHguhABSgCzP86og==
X-Received: by 2002:a17:906:4346:b0:947:7b89:6779 with SMTP id z6-20020a170906434600b009477b896779mr10506148ejm.46.1681257473007;
        Tue, 11 Apr 2023 16:57:53 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090617cb00b008c16025b318sm6595878eje.155.2023.04.11.16.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 16:57:52 -0700 (PDT)
Date: Wed, 12 Apr 2023 02:57:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct
 brand name
Message-ID: <20230411235749.xbghzt7w77swvhnz@skbuf>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_165758_883970_FEE4481E 
X-CRM114-Status: GOOD (  11.99  )
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

Hi Arınç,

On Fri, Apr 07, 2023 at 03:50:03PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The brand name is MediaTek, change it to that.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

It is good practice for series larger than 2 patches to create a cover
letter, which gives the overview for the changes. Its contents gets used
as the merge commit description when the series is accepted.

