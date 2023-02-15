Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D1AC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzK5I1pNsEideIKIsH0oUfCStwuiZkZL1s6hJYppcDU=; b=FxVa5PMBFyzwMeBdJGFjTXZ/11
	k8eXvyofco0XJ5qWhpDBC5qYvqYk5dollejk+/IRByeXSBV/wTs/EBqUdVVKytxIKYQWTHpxpkPXf
	VH0ve9BF3/IlF5KkCUxtQVqzGElxj97I5xgFMKNzaQtRP6YN0FLMdo6F8A2SMpCMlN4/fJGKFsTB7
	OZH6VZ3EvokbMlnVKeRS7x2tace94x0BbgpJyAgzFsEjnZT/ko4WqzqdA2jXq4Po7lKjQ8gqENZZ4
	2MYNKIoolqQhYHW0zSLYwvtZpRjqH3Hz8JVDlrMgjGK9127sW7fsFpFYSdZSnX7LeVlDf2EyfTVuZ
	yn3k9RZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOZJ-007A2s-V7; Wed, 15 Feb 2023 20:39:57 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOYz-0079rl-LW; Wed, 15 Feb 2023 20:39:40 +0000
Received: by mail-oi1-f178.google.com with SMTP id be34so948635oib.10;
        Wed, 15 Feb 2023 12:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzK5I1pNsEideIKIsH0oUfCStwuiZkZL1s6hJYppcDU=;
        b=pNfQ1I4XrL9eLrl0sapfVCDugIHaYZZtXCAx9EbSQuIWuBj1ZlFFoZ8RtC71S2orrB
         PgygenA7SRKCzCHgGc9YUI1SYRCYm4ejuEkFkKT3ZFTjz2A/Hm09QW0hLxe1ZSS0gRiF
         JovCzkohIuXoBuYDz/ONy0PG5l72vE36GsB8gTCh++/5XpQLGibirKmvq7g6tNmNahLQ
         llOvt/2JOBssmoU3dZQIuugv2SJuVq+byz1bbXxD+TqZsf0N0h2//Msy2yE7DjG0WFNF
         wwpJrEHHv6CVe3VlX5TZwSZJdbvKez6YumtbgjBd9FAr9ARk+R6wsV8NvjZfe20ChYAB
         CIcw==
X-Gm-Message-State: AO0yUKWtwitrqkZNKYSIbDs+8ut0YXcwZ+ikqiSl2mY3aejnUJ5fuxXZ
	pix5OjF5a2Lt+kw3lYw7Vg==
X-Google-Smtp-Source: AK7set8JGewk7qhxhDolu1AIuSeGTxio2AJMsUYS+A8/PyJbFDXDhFOcAygr16obLyL+w8kSVqR+TQ==
X-Received: by 2002:a05:6808:5d0:b0:378:3ae7:f746 with SMTP id d16-20020a05680805d000b003783ae7f746mr1428467oij.47.1676493575389;
        Wed, 15 Feb 2023 12:39:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s16-20020a056808209000b0037d74967ef6sm5497922oiw.44.2023.02.15.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:39:35 -0800 (PST)
Received: (nullmailer pid 517622 invoked by uid 1000);
	Wed, 15 Feb 2023 20:39:33 -0000
Date: Wed, 15 Feb 2023 14:39:33 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Felix Fietkau <nbd@nbd.name>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, John Crispin <john@phrozen.org>, 
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	"David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, netdev@vger.kernel.org, 
	Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-mediatek@lists.infradead.org, 
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v6 02/12] dt-bindings: net: mediatek,net: add mt7981-eth
 binding
Message-ID: <167649357343.517569.9770950931766718368.robh@kernel.org>
References: <cover.1676323692.git.daniel@makrotopia.org>
 <f94af4b4a0519530b5a87989ef08f9f85a385920.1676323692.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f94af4b4a0519530b5a87989ef08f9f85a385920.1676323692.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_123937_733881_FAF7BB1A 
X-CRM114-Status: GOOD (  11.41  )
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


On Mon, 13 Feb 2023 21:34:25 +0000, Daniel Golle wrote:
> Introduce DT bindings for the MT7981 SoC to mediatek,net.yaml.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 52 +++++++++++++++++--
>  1 file changed, 47 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


