Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA67C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EreiMBgkUkPDnOXknsG9zCEhykLlgCHgknPkvjocXDg=; b=GuihB1N4LlVI2OYvMczEMsrjxh
	x7pDeMIOWOYtCtBK9LIma0IZhqeLi164A5M+mj+8O3eQy10ErMRkDDeHUn/emN5N6FCP8GYkjRei9
	7wCCWbPAP4wudBSzNl61D2nUv4Bqjo/Jquhu/vvGDZ+orHvXgKAeTkIl5FHAVt+JtRRFrGcQO6Pnh
	uJNC/Opn8UToFWKTdI/jfsEi8UJ8D7MDwR1YWSNTCZ6LPTHwlssUD0S02oEBNFx2Kp4UKik6UGQWW
	u5EFsckU4jR5aYIhcuxY5ZnE+UHJGC0NaM0Tx5ZQ/6DxOkXjAG8Uncu6okX9U3yWiskAfzKwhnc+C
	xvVo8W7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkPc-0033Vn-2M; Tue, 03 Jan 2023 16:45:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pChKs-001XQQ-0M; Tue, 03 Jan 2023 13:28:21 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g1so29546621edj.8;
        Tue, 03 Jan 2023 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EreiMBgkUkPDnOXknsG9zCEhykLlgCHgknPkvjocXDg=;
        b=lE5AE1qGEtXjN22b/S3G1AETkhTNukPRCJ4MxTBiQDAZvKUW5Ht/FmtEV1dZHfh5LI
         SdQGBRnzfQ3SCS4mv+u7ehEnIDFFje/JfTflRycyjJaXu3743zr9CA521YiYV2oReBOO
         NRUM++tbYpXSPn9KbvB6lyyHTFLLe4UwYorzNmjnlIYdAnrG/5BHw67BdeW7LOKasHge
         kVXJ7dzv2m86oq50Oj9SszhO/YT6R1s7+1RAGL3kah6YSmlw14nq7IPv4JYCMqJpwtpA
         aFlILoGaQI/EuWQ1Y7yCIInIf89eivf3CP3hv4ftOVUsifpNEENNHDfs10EnSDtfdmCY
         rqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EreiMBgkUkPDnOXknsG9zCEhykLlgCHgknPkvjocXDg=;
        b=12gDFne+xkQwSovAuq+S+pWlBlccOboAriAVwx2g/HoKTZ6I2JSaGL5rKT8Dhetof1
         nUokOy6hyQllXIPZ4jbRCxWtf8NAt6QLpc1wHuS2faCg76O9PeaqYraeWmPZb3ZG8Wsd
         R/WStr5VU12spg92m0huDcTtU2v/mH7WUyL24VD8FVLveLmk6ZMRI7kGwnAWMLSeFZLf
         N+PikrYb64XcEaatdT4M+6NRMdWp/lN6jaxkifw6YYXKJSIeTO7K1xzavQiHn4OsaixQ
         GOTya3MRsnsFpymjsDbCHBhfHVCASYjg4NYqyscao9zY3hfeMvAP80pgH5cW3ZBLrO3H
         S55w==
X-Gm-Message-State: AFqh2koU3NafeX7jYOusS3Vf+y65sY3XNUXOIz9/IKYN+R+pCOAI4lvV
	pLMK8Ure4d9zX/LangLx0sk=
X-Google-Smtp-Source: AMrXdXvoJaAQMTLwVv4xcf4a3QFrTZo4b/RaZ87Lu5eNpFpVoktvLuTqAF8pDwLTyNSShD7Z/QBTWQ==
X-Received: by 2002:aa7:c911:0:b0:48d:4504:32ed with SMTP id b17-20020aa7c911000000b0048d450432edmr7659170edt.37.1672752487476;
        Tue, 03 Jan 2023 05:28:07 -0800 (PST)
Received: from skbuf ([188.26.185.118])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906538300b0082535e2da13sm14126800ejo.6.2023.01.03.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 05:28:07 -0800 (PST)
Date: Tue, 3 Jan 2023 15:28:04 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 02/12] net: pcs: pcs-xpcs: Use C45 MDIO
 API
Message-ID: <20230103132804.pcqksxtiex5rglnj@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-2-ddb37710e5a7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-2-ddb37710e5a7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_052810_138198_4991EEA3 
X-CRM114-Status: UNSURE (   9.77  )
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

On Wed, Dec 28, 2022 at 12:07:18AM +0100, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Convert the PCS-XPCS driver to make use of the C45 MDIO bus API for
> modify_change().
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

