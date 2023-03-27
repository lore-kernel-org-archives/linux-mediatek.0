Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9EFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kdFzEqP1sLEIpGSE6bD26PwKxdQuQNtb+UIdaFS6w4=; b=FtJRhjsD7CEJBLiTNJIyxerTCZ
	nHDzuJ5XlcEXV1TlReTdWI4g9ngn2vU8SgOfC/aIGgRaoIT91hPJ4W9QAiHf/bBD619nqjcwYVx1y
	gey9Gz9gmaCyhDzC5mQzmSLAFr6BSJDB43NpUOIfF29CSbZw59rzZ/dxFQT798kr7z0NjBxxvKLCm
	4cffsG88/qMeFcS/7bNZd8psGv9Grctmx2LZx397aSnNpjNaSbh9/wbPKT1i4geADN/B+K65bMwLB
	zS/SKO9tR/cZOVuePhJwOjlTOYiPPOXtBvQUMcQumgDyGj1m0Kx50W9eyVQFTIHrMJsgN28Nv2UV9
	0UEg6Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgs0z-00C87s-38;
	Mon, 27 Mar 2023 18:56:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgs0w-00C86Y-1I;
	Mon, 27 Mar 2023 18:56:19 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y4so40359850edo.2;
        Mon, 27 Mar 2023 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679943375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9kdFzEqP1sLEIpGSE6bD26PwKxdQuQNtb+UIdaFS6w4=;
        b=UGymmXiuIlLml8ijpf+xg6TTWxqyOmO29fMqond0Chl519oazCi6HipKFEmbHhcRyr
         kFd+NhLJL3R6Ik/DjNFUBBPD4ptYE7ntse3turxwUSZctRayA3G7gdNU+x0tvIG0CkdW
         HQqz5n0+Q3XHZoIBK58G+nO3yfnyykbwx3QREmxdBgiuTe7P7XF9W3K/q4cQDrlaB25v
         Zw+9STo270ZfEmqSBD/n63vOUPQnfgz9sijrU8Xni/DZsLb0HqhzF2VGIUYL+L6Kbllw
         aBno+V12LnQbwPUiyVYuvTpxZM/Whl0JoawAMyrj9U+fbAl62+noh7WAqEpTD6QuKnhc
         OiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679943375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kdFzEqP1sLEIpGSE6bD26PwKxdQuQNtb+UIdaFS6w4=;
        b=OEheHot5DA+jqpKYveQYm2mr9Kat9eUmMLgNWEhCxQ+2mRiiORLihBVkUPEhVijRES
         zz19adoKmfl6eF+LAz8wuNouaf1XZ1LrCU4HZFTvtMV6ujsEHYCJ/cLlY/fFRE5yQDbw
         5H5Slir3QIS4/xxF+aJdS9V6p+vdaoF4yfSkOo6OqGAfRE/iinaOvaKjA0SG2ROjlHI/
         TdmBidjC3ZDt1GPCaGeTFn55cUbHwcjarJQ7umLSa/BYHda2owSUjBpMLThZIAZMi0aJ
         5Dgbn+4DcbmBlxxF5q02cBIklIDVjRroZ6Xvs5wXnEbbGjOEVqd4IZNP7qy1i76h8n3m
         THzA==
X-Gm-Message-State: AAQBX9et8nmY1frFnQF3mC2mPPMhnVBckJ5Km3fSkCQDJjsfkBOIFJoI
	QFM4EQpqsYXhUiUv85NNRqM=
X-Google-Smtp-Source: AKy350YAx3rW1SyuJCnBZhBxCFQ7rsS3Tq/yQDzMp69TUHeQbWPH6REg0eDj/nLcvQWAEZQjxF/XiQ==
X-Received: by 2002:a17:907:8687:b0:933:499e:62a7 with SMTP id qa7-20020a170907868700b00933499e62a7mr16565873ejc.49.1679943374605;
        Mon, 27 Mar 2023 11:56:14 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id u27-20020a170906069b00b00923bb9f0c36sm14288264ejb.127.2023.03.27.11.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 11:56:14 -0700 (PDT)
Date: Mon, 27 Mar 2023 21:56:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net 3/7] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20230327185611.gjwlrmhaiorfpj5q@skbuf>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-4-arinc.unal@arinc9.com>
 <20230326140818.246575-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326140818.246575-4-arinc.unal@arinc9.com>
 <20230326140818.246575-4-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_115618_438539_37B96CBA 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 26, 2023 at 05:08:14PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There's no need to run all the code on mt7530_setup_port5() if port 5 is
> disabled. Run mt7530_setup_port5() if priv->p5_intf_sel is not P5_DISABLED
> and remove the P5_DISABLED case from mt7530_setup_port5().
> 
> Stop initialising the interface variable as the remaining cases will always
> call mt7530_setup_port5() with it initialised.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Again, not sure what is the problem, and how this solution addresses
that problem. I see Fixes tags for all patches, but I don't understand
what they fix, what didn't work before that works now?

