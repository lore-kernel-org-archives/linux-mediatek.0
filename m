Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB85C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySmRc53vKROoV0PWm3ZQ6WwdfwBbVdA+rwOuG37JzZw=; b=yDWeE6ca6OQGGe4OwwYvFN7xLG
	t6RVYTxyDa8Cb9H3VmWnc/p85ZYJ8iXHeuQ87jp9cI9MT+oWIKS1feEW8IIsC2B95TCD4TA0JLFzP
	4YLz8d0rQJ7ipRsTHEd6+cbQUE8hcQ1i0LRUmP6EPVBDMHm/rBVWlC1YfHuxW6uUbaM6AWOQtqHw9
	11zRmaNXcTYzEQZ4Nebg9SLPBLPpJpr2+u3baQiOpYlD+mTSgJopk3I/nAd/LuVYHQM+yYkKDgQPh
	EOgdk8wHoPNxuzdW1BsvTf/C1TYU9B342SvVzsPqlVCCLjOxftI/s3oP3qA5q1AUmMJ1Vb3eA/0w5
	VZ8rZoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XBB-002aBK-0Z;
	Fri, 26 May 2023 13:08:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XB8-002aAJ-05;
	Fri, 26 May 2023 13:08:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-510e419d701so1336433a12.1;
        Fri, 26 May 2023 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685106500; x=1687698500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ySmRc53vKROoV0PWm3ZQ6WwdfwBbVdA+rwOuG37JzZw=;
        b=ZWX0QrcpW5rWQ8p4KBmcTFHIzFOzfgnezwVXPG5rXkBt9/iCaSoF+Tt8pkc3eMSCH2
         3rVCNwT6b/ksKMFKIXXUlSLc+2YqfbsJ0p17Li8YJ1LZkRrlhUYMFKJT+sD2AiSvBhWY
         rCC1YfMg0G8oQYiKXKqNvoMNoC4gxR6eyCHD++UqE7bErXC5TGuDnwj9CuPce1gSPR3X
         4otRb1gYbB5EH+12gj0Sp2Stp5cTsIb6sdL9e0yxO3b3CS72FsJ0lD1dqrgc52yk7AtC
         6XA354eBLzXZlXX02Z7U/wKis3vmVXlmY+r1CjI3TRlq1euNUOF7MKkabwaQfbTAGsAT
         Z+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106500; x=1687698500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySmRc53vKROoV0PWm3ZQ6WwdfwBbVdA+rwOuG37JzZw=;
        b=c4Vr2gDicEijTn4rzQlApYq4YunLb8n54esU9o7CWczRJI9dOgchBCWKgG8lhZQwUk
         Ruc95YInHtwu2E8muu9tMUFT54WIRzc+P3dX5nU9GImJ0btvePW9pJRSE+qekJ3erQPE
         P2HiVlH1f6IYEOGDz/l3Phs7/uKudkyT2T/HWsJcbP8qxR3eCEfYsy0OMvLiog5bv2kn
         E4zwzUwcANhKL8Qi93APWFxeYtiosxoGG4Be52SrKc2+Fr/dX4SN4HiFa4mO6IYdiiY2
         3ojFEHNJ+Nq+kF2Kt6m3llPSPtPCHptD+3htuCI+By2OBKWH970DqucMHc5vAnyrGi/f
         ePuQ==
X-Gm-Message-State: AC+VfDzzO/J7MSlARxHkB9/6epdSfzvhFYSJsXW82aX372DPbyZRdf81
	y02xJCas91HYJWuqMIcBdt0=
X-Google-Smtp-Source: ACHHUZ5IP7XtAUQ7qtAUErDZxK4RiTHj9xBIsKmfmWAwOCCjD4jBlU4hvp4FtroBOvALb7tr+oUMJg==
X-Received: by 2002:a17:907:3d92:b0:973:8c47:2a02 with SMTP id he18-20020a1709073d9200b009738c472a02mr2178906ejc.38.1685106500249;
        Fri, 26 May 2023 06:08:20 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709065e0c00b009659ad1072fsm2151667eju.113.2023.05.26.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:08:19 -0700 (PDT)
Date: Fri, 26 May 2023 16:08:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 14/30] net: dsa: mt7530: switch to if/else
 statements on mt7530_setup_port6()
Message-ID: <20230526130816.wr63736dn5jmaem7@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-15-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-15-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_060822_075008_E3744247 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:16PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> This code is from before this driver was converted to phylink API. Phylink
> deals with the unsupported interface cases before mt7530_setup_port6() is
> run. Therefore, the default case would never run. However, it must be
> defined nonetheless to handle all the remaining enumeration values, the
> phy-modes.
> 
> Switch to if/else statements which simplifies the code.
> 
> Change mt7530_setup_port6() to void now that there're no error cases left.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

