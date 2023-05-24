Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9BDC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDQRm84Nc6EHgMBi0uoHQy1EbdvJJMdPPoAechdeEGo=; b=FkFXn6NiEOpuw/BlYLhtXxPuBs
	a2/LaSohlpO55VHpoJYaDi/oMUGOMRBAYTBUIhIG9xfq0Tcn7OKx2CXHWb42yIYgXWHu1BgJG+L0H
	eMyl+w3HBjTvwAO26CdCG7se1bdsVX5AID60VJ7Cktv9sgg6r7RtDpjmZXmMLVggHnCaBelU2AEP6
	HClWmyGEkn+n+RHGGuhEEljhefWoL/7fpUTwx4lMgPEh66r64pR2kiAhzo9H1Do+SfvfxKuqOuk2D
	Kqc8vMBK0UPwZhSIZtIpd2Ip21BrL37REaNGhO5pD7syn92akATgHYzK+UTZDjZgEjyuzxeLdA4N1
	7yIhLExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1srk-00EJwf-0K;
	Wed, 24 May 2023 18:05:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1srg-00EJuU-1d;
	Wed, 24 May 2023 18:05:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f60e536250so705875e9.1;
        Wed, 24 May 2023 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684951533; x=1687543533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LDQRm84Nc6EHgMBi0uoHQy1EbdvJJMdPPoAechdeEGo=;
        b=nD09xgL0gBt2IymT9DkM4m7qDWcmXP3uDtqP3YJzoNh8Pk0DQgfkOMk2qngHkshflR
         iyt/ECrVsP2sibcq9WO91XiF5KHB74UYtCcuy9FgAlobhvYf6awu6ao/lhvzEPYqpLkd
         azxQB+yKyrJinI8QoEAcfcHjWahSH5cAaAU1h4FTHDIXmq9A24M2gzmNKGOC/1RDC+Rs
         1rc8Td64+BttaN36GwSaNF6Ii4INn8A8Sp1e30fzDkp0hBAepKgcU3W2SqLFtRwDs+br
         jCusXj6YBdtlj5dAEurPvFw3Tp9QT0zrJWu34eC+zcXTwsmH2YSHMSoXPSip/jmvy8S5
         kO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684951533; x=1687543533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDQRm84Nc6EHgMBi0uoHQy1EbdvJJMdPPoAechdeEGo=;
        b=WaRN39Td68XSSvtiHHKd/oQV8ZMri2jYZ9laAuqiavk4bsc4l+2izouvabkrX/L5C7
         FBc5cXjHBG8OzIhX0QhBmVrxzawFM6w24qtRBoftBSBgTPLAFd0mkfTgUZQPf7bS1b0C
         jyRYGEOYoDi1iYpcvPbLi4C8ovdUjuVFQyJ5oqkmIyFDAYAFwdm6QcqxDha7Zv+dVoA0
         cb/zQtJxJoebIEGo/sskqEriSZQTKZJv2boH76XNXufmfVmlg6MRjypJ0UElgf1jk3Ij
         yYgNQwr+CrR2QKSyMBd+DPBgTDI7ThoXbm1F82Ns5x73eHlJNNDB1nKF3yAA5T+xEG1S
         cSgg==
X-Gm-Message-State: AC+VfDxHjUu48dZjqt+h6DIeunt9YsMTwFBYj817trRVqu2Hl8EoCDY8
	L4luBSS55vCt7uzEO3Lam2M=
X-Google-Smtp-Source: ACHHUZ40EUPJENiILINIaAhHJVMjtTSFNrL45/66eTCmqsyd1E2+esQwcvAEyUxRdFxnsSTZFKcQhw==
X-Received: by 2002:a05:6000:1049:b0:307:c0c4:1094 with SMTP id c9-20020a056000104900b00307c0c41094mr88713wrx.34.1684951532706;
        Wed, 24 May 2023 11:05:32 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6086000000b003064600cff9sm15197460wrt.38.2023.05.24.11.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:05:32 -0700 (PDT)
Date: Wed, 24 May 2023 21:05:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 09/30] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Message-ID: <20230524180529.y7vl5mb4rn4vwdhh@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-10-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522121532.86610-10-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_110536_544073_F3847892 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:11PM +0300, arinc9.unal@gmail.com wrote:
>  	default:
> -		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
> -			priv->p5_intf_sel);
> -		goto unlock_exit;

You could have probably left a comment though (that doesn't cost in
terms of compiled code):

		/* We never call mt7530_setup_port5() with P5_DISABLED */

> +		break;
>  	}

