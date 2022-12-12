Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287B3C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8BagAOtehslyk1SZT2MB25JYzaE7cVai22deGdaHF0=; b=34kOIdkh43uNmwI5rn2hFXILIf
	l0fFbkZxaLIeNHTSG1ZJemFzGUzuOAB23unVzmX1bX1gltG00fyxdFm56Vjje976mGIYCsxIB18Hn
	TCQzZfLM6CNNmxD8Fga4XwdcBM9PjL4hKh7z+QwR1Q7UUW3ibPt6BHF/ET+w0TUPRhzd208EdLMIU
	3ygharr4WWEJ46UeOTDKY3KwB6MaA41R0ep6KkoqvY/aLUVEJEPFZegGLX4+lv8gSWdhSnMfkFGY/
	NaB0/SC4WC56m8c0XlBpF8ZunQp7nGmk80YKI/wEkF8RTQVafemlztNcLM902ZMMiNUwtGnLnSqJp
	Bwb/Z30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ntv-003wnz-Ns; Mon, 12 Dec 2022 18:51:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ntt-003wjx-E1; Mon, 12 Dec 2022 18:51:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id u19so12015574ejm.8;
        Mon, 12 Dec 2022 10:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L8BagAOtehslyk1SZT2MB25JYzaE7cVai22deGdaHF0=;
        b=GOChkXOnyFhD54OkbbiPmVfsrGGTrwxBa30qOt4scbic06PNfTs2rPI9l7AxYx+FNA
         MHPirb+WhMYo3KM6AMha5dTRt9s69IsLa5ctttyfJMf2k5KDREqemXUXOIO1wU1QHaVa
         jm2oMoj/horG7kCKolRD8PiH2d1iSFzWWic2/O86kQ3CwnmJ/917At8wus3qgu+LOBfi
         1G1oiF2k1h7eILfunxvRJ/9htrgnjelaxqs5piFdMrYz4l3Ns4Lf1Pp7KhRBQ7RUT+ph
         LSBGg1lSzcTmYSdceb6fDYj7ar8dENcuIAonXamK4c0hvJ6f8FX4lr3Lmh6ZL3cAbPZg
         07/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8BagAOtehslyk1SZT2MB25JYzaE7cVai22deGdaHF0=;
        b=YfNTTYnjXGqR/KJqosxLdSaaZ4PLS1FOSCCoEWUhpS6g2VcxRSdV3yxunaxz6V3yvq
         PDGoVChJA/GOTSB4bDvYN+tKdj9snejolQol9pr/2ScxvHmnseP1ki96EKd7taY5520Q
         ta5RYQ6piJOp9/EmaPX9YQmNP15uBREe+aLWSrNaReQ/tzXrW6CEHCwHhJWpymyxxavn
         L79D7hYYwExqw6DYk1wo0MuAd1C2blnGQHJQ6xpPtVLOTzOwqHY16KGqfvuRVW+IoCDm
         WJg8jAE8FS59ki3XnWe0dwXQ/TAv5gz+FwnciG0TnYq/6849MS6g7r9FWNkwc3eTIG0r
         VTJg==
X-Gm-Message-State: ANoB5pnorjQ/iS+fABfNzJ0HR0YfIpqhTgwIlUpIY+aBjSZMvqOyLYTe
	GGxTtFENi4FVgU/bBStzegY=
X-Google-Smtp-Source: AA0mqf4s/TSH0fOWRZ57YqqsDWVMKuesXl9ixlSkK+CFmTWZDK1Joj3SxRP/xOG6m80UAKzULAS4uA==
X-Received: by 2002:a17:906:d8a5:b0:7c1:6f86:eeb with SMTP id qc5-20020a170906d8a500b007c16f860eebmr5271393ejb.7.1670871095795;
        Mon, 12 Dec 2022 10:51:35 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906329700b00770812e2394sm3569189ejw.160.2022.12.12.10.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:51:35 -0800 (PST)
Date: Mon, 12 Dec 2022 20:51:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 net-next 05/10] dt-bindings: net: dsa: allow
 additional ethernet-port properties
Message-ID: <20221212185132.x3ydeehlbqnu4hwe@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-6-colin.foster@in-advantage.com>
 <20221210033033.662553-6-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-6-colin.foster@in-advantage.com>
 <20221210033033.662553-6-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_105141_493335_C28FC122 
X-CRM114-Status: UNSURE (   9.92  )
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

On Fri, Dec 09, 2022 at 07:30:28PM -0800, Colin Foster wrote:
> Explicitly allow additional properties for both the ethernet-port and
> ethernet-ports properties. This specifically will allow the qca8k.yaml
> binding to use shared properties.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

