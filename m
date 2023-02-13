Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D62C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6I/N8Drrl5cHxyvpTweuS2aXRAsTRiT9hQassySM+I=; b=KjXsslvJHEMD7hAhQSaKm0NKlK
	pb2uqRgbOjII0YOoI2ypGEzTSZ7481zduYzlYXTru9cnd2FPjo38LldRQ2cqoyslxhI4AL1+hc31+
	5NElR71ZHvdoOqwrmNF+K8KlWKbIXiXp9nqLrCCQKHpyi+DHfadPFkmgr46eqqTcZA8p1VXKbBES+
	L0mtsqwCly/nO2gjCO8b+NCoXC0sIKblEe5nwAYdcUipEEzwRQXRVBH6VZBqBPn9ik0wMGzJqezh7
	sY3KuD5FrjQc0fi720LNywiT3T+WA5GQEsfbnRltaQea6i1YuvBzPYO2JFxXdtaV10uXwOUgpIIyb
	Y7DBHBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZ5z-00EqDE-P0; Mon, 13 Feb 2023 13:42:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZ5n-00Eq8D-Pc; Mon, 13 Feb 2023 13:42:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ml19so32105545ejb.0;
        Mon, 13 Feb 2023 05:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6I/N8Drrl5cHxyvpTweuS2aXRAsTRiT9hQassySM+I=;
        b=B/sRO7dV5Zi3qNSLCw4IW0Zgl5IZEMUkqBSZ3iK13NuxbfWCudV//E8VMJmiZisodN
         q/gtTmJTMsvEq5XfEHv0gEa6bXm9iN2pVAIQu1bZ99eQSJRIVaegn9j+ab7gw7YZFz8t
         +QP6E8TwauPTQKPDkzMYfEnx6YtR1B2sx6V+bmD7RblxwZKNvw2/YXAV+hzHH1j2kTHh
         KtdhqDqrmH3pxuG+c+8x3HQAwRHirchnSofAAQdNyyaV2Sw4D5ifQ1pKKhjBMcIjz9aV
         KP9qlwou0q/jpgTuCTzvSGiDmXtS1SOUmuu0y62nK/KsXu4PRkU1xC57PbmgGO2G/5sn
         3REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6I/N8Drrl5cHxyvpTweuS2aXRAsTRiT9hQassySM+I=;
        b=JpXsQeHdXhj1w7gdR2LCxZ1qTOu4BORAndOpghOKOGGKRokcj5m8BVJ0BPnzxn9Xvs
         qS/g73+CGCDw58g7j3yybVGGxjC/4HFP76mdh+D1XbisVefUi/ZVHgBMiTFaV9kkGjan
         nd3p4BTIs+r3Scnl4zYMIzS2vr5/2NbowFW9TFynNm0a1LdNwvuKzAa1XRdple7RrF6I
         nZmsNpPK2l/TXfRrZ3xGq4esQSebjoWXA09J+k357ATD89AC0cOt2KbE/xeHrEYPGsad
         Bs+1zT2CkZNB9twDpC5hwmiOc4Zy1LgnTFgD2s04EjDhJ3JFZ1Rn/mAqlmSPKcV4RmJf
         kcFw==
X-Gm-Message-State: AO0yUKWIDNt5I583jHvAMZ4DDNA+YJZeRsJ/RuluIy3k4ga8POZ9+UzO
	Ol3RIUwl0Lgpn3NcgUVG6iS0J5PDZpFjXQ==
X-Google-Smtp-Source: AK7set9tjrJ0ch+fz5ahGpelRBq75D8nllqGF8czYP1fSFJ5Lf8JJzIx8PMXukUk2qUoucx6YZqJsw==
X-Received: by 2002:a17:906:700a:b0:88d:ba89:1831 with SMTP id n10-20020a170906700a00b0088dba891831mr19627765ejj.2.1676295720045;
        Mon, 13 Feb 2023 05:42:00 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906c08d00b00878003adeeesm6784525ejz.23.2023.02.13.05.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:41:59 -0800 (PST)
Date: Mon, 13 Feb 2023 15:41:57 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Richard van Schagen <richard@routerhints.com>
Subject: Re: [PATCH] Do not add all User ports to the CPU by default. This
 will break Multi CPU when added a seperate patch. It will be overwritten by
 .port_enable and since we are forcing output to a port via the Special Tag
 this is not needed.
Message-ID: <20230213134157.k5ty4kko7xjhuvpt@skbuf>
References: <20230212215152.673221-1-richard@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212215152.673221-1-richard@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_054203_874626_64568E25 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, Arinc Unal <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Richard,

If Documentation/process/submitting-patches.rst does not completely
clarify, I also recommend running the "git log" command and studying
some of the formatting differences between this patch and any of the
patches that have been accepted.

