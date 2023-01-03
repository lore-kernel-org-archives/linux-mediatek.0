Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73418C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiBka+STdfWqXEYEF1M8oLHBS2PSmzps9GRArvQ0wNQ=; b=xxgLD/5ZY1a8jXBkdW7A+E2NoY
	5DCnuMcL77fdjlWAPAIy86m71EwO7Yhx6acWu+cjhih4PH//9n85Y0ymj4LUV99sxIvoEYnRzGu96
	SJEOnwbpwPstEvdZBNwYwZkrTwZm3oCFSQgplwr0UFLEy4URk2Y8u8RliqVuo2LIdmV03QGvJKy5H
	Q/KnxVSsbKfuUE2F/yner0liwqVdzBjQg+St6lMidMpSdFBTx6j+5Ey7XTn0PRnDSTtSbnAeAPNqh
	h6IXhwMXuuOEEJF/yt249oXW+sRsGVN0WajkG1M7RPtc5gHzbDSt8LbBnsb4TH/wEozjk7I2x6twN
	cr0DIyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkXO-0037kc-2u; Tue, 03 Jan 2023 16:53:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pChnP-001jRG-C4; Tue, 03 Jan 2023 13:57:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ud5so73824266ejc.4;
        Tue, 03 Jan 2023 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wiBka+STdfWqXEYEF1M8oLHBS2PSmzps9GRArvQ0wNQ=;
        b=f/XvfUxi6Y0rsfgiOoq/mD7Rx41wdk8aKmk/uWT++mY+WIDwkDdOK6GnzV6Ai6643i
         uhSwNjlL3L3Nt4mjJc1iZFlYPVw9WD5YTI/C2o6JCc9xFbHnlpp+4JU9nIhxQ+hiWXBd
         B5sNy/sPbatnJT9qWxxrteRXbaw+nlmoS8zXKR9wMaI9ZsXHlLo+5xLPOpQIYKrlzQpE
         5+O9mrtWCwpvo03dielomObAafVznn40dbmQT0Gvbtaulxf/VoiOreOskgBPq82gf6q+
         GdbtCO1E8JIw6IAO5wfaUdH5WhvO6zS70Ss6C6UePL6TNcu9g3j1I0mEq9uZrFYP0rIH
         qzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiBka+STdfWqXEYEF1M8oLHBS2PSmzps9GRArvQ0wNQ=;
        b=16BCxJZroc6qwivWBaBMlxpQ0WAbCMb0oV35GXasM+b2GZ30r/bxFwuqH6iYQ9l1Wu
         1Cc/4IazmTMjtbYbsjwUXWjbelovi6qLdBEn+llNT5wwmvo08cKw72W9+P/mQ0oBqlPO
         ohHyv9TirGeyzOle2CUlOURLxDN44alXKzaPa2RCWBlEve0O1vBGrWT1gZL8/PYh8qc5
         eXTKyXhi9TXTdIE+T9l1vVeeBfsHkFcv8m8ETaHzDRyt8qa/a+O0611OU7tMS5xD8keA
         d1YabPm7m/ojyNzQ00W5zg2qc8B9PQEFq6D/vFEWKrtheGHw2tm8mf2tc8z/E9FK2M9J
         ZJKA==
X-Gm-Message-State: AFqh2kouxXvpl0bzugCnSSGf2earcfsQmtM8m1qdIvIp3I+PtylPKO9B
	lNhI3h2mKA7aSmFjFHe7jA0=
X-Google-Smtp-Source: AMrXdXvHEPEUBS/O7zaaU5DAH5vatKPRD27MbUHcClggxuFQNb+o/DXxJXkEQA3LieO19gw+yFwtrg==
X-Received: by 2002:a17:906:8447:b0:7c8:9f04:ae7e with SMTP id e7-20020a170906844700b007c89f04ae7emr38712372ejy.22.1672754255330;
        Tue, 03 Jan 2023 05:57:35 -0800 (PST)
Received: from skbuf ([188.26.185.118])
        by smtp.gmail.com with ESMTPSA id k10-20020a170906158a00b007ba9c181202sm14095026ejd.56.2023.01.03.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 05:57:34 -0800 (PST)
Date: Tue, 3 Jan 2023 15:57:32 +0200
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
Subject: Re: [PATCH RFC net-next v2 09/12] net: ethernet: freescale: fec:
 Separate C22 and C45 transactions for xgmac
Message-ID: <20230103135732.saku5om5hgyw3ygk@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-9-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-9-ddb37710e5a7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-9-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-9-ddb37710e5a7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_055739_498574_A82DF1EE 
X-CRM114-Status: UNSURE (   6.80  )
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

Regarding the commit title, there's no xgmac block in the FEC. "XG"
means 10 Gbps, surely there's no such thing on imx/Vybrid. Can just say:
"net: fec: Separate C22 and C45 MDIO transactions".

