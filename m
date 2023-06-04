Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C36C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIF2ahGzJpyo+TqeABEPHibTttnCkEMB3Njy7q/BSEo=; b=VjOGonCTvrnq310WOCQKb5Oqhb
	ChiN+35xVGw8SKC6a4/AOgzC+MPQPKTkzJqA5ORecjkUIiZpTCkMBATZB5b/O/q8w0vUdqV0uvMXS
	n01HWnx55qed4VY19UzUAsP7KD+d/qv6FUSBSdIGVS1rJcCkG+r82T3tLBXtN+kUopO0S1/T5HZai
	RS4DeVjZEkrHp0dOTbDtD8/6c+2TdbCodQWplFjDcGMv9CyfCRd0Qe2J7w35F4xCXIu1wHadgvjCE
	uUsCzLd09t9OkRzAoAseuoGP18hzcLbIu2uuQma/wt4XdG3rKzklSovD9Rw8NxFe7rhRoGJ8qvTeU
	YDMMvmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nk7-00CE11-2p;
	Sun, 04 Jun 2023 13:25:59 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nk4-00CE07-0c;
	Sun, 04 Jun 2023 13:25:57 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977cc662f62so106234466b.3;
        Sun, 04 Jun 2023 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685885154; x=1688477154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bIF2ahGzJpyo+TqeABEPHibTttnCkEMB3Njy7q/BSEo=;
        b=N4P+EYIEs8NjOqM/Dmregn7Jp/GB1iY+W/H4AyYoNezm+92mg9UetM3yHca1fGjhZG
         /4854DPF5NfM/9eUZ9OtKL7xYKYqfH6/WMLcpyDJ99JJIWC0FfbhoAkH+XHa8kN3RGGF
         IinXBa20IFIEGo7ktOSH5SCo/YfLGjirKDKwBFrHvn+ez6wCqftSoQXBZkoAuiR/L6Jz
         SzbrfVawaQrL22pGLzYX+8d3G+1g1r3A5iPwhBFti7nZed3oE+p5csx0oY5Uc1BZRuoG
         UNxEZAE3M3+aQnaFi8fI3iEqLCyTOiU8fHXw+l2wkak1IVi1k9gIAWxEKr0ncVZYwTsn
         3MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685885154; x=1688477154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIF2ahGzJpyo+TqeABEPHibTttnCkEMB3Njy7q/BSEo=;
        b=YJZyeyLiKrPueNwm9f+/z+jAQJIV5PPyVTHWuVvft0dQx9EGIJIfiz8MuG+tMYpxVs
         xuLhSIm2qvzRnvG6p75R3Yj/cqI4yxshwuXyO/XuR7hcqq+srdOpXbYwd7rSJNEhUjmr
         gparhKHz5m1jbAFHBYr/CwSi3QXbAXUfjgf7LsHXJnPTjAaJfWHFmsqNG0ibeOuXNn9v
         bVtl7eGXVJVSwYRzobRCQXiJB5Z5y/ROBL5k1iC18l+ni4ZWIdY/OA3bbC2AIl0C4sQt
         VAcCb3PmO26Q13oRGPIYJqZMwYiV5CE/r+JNIlg3KPacBaX+76+DZlbb42P1L/PzcCvL
         T8OQ==
X-Gm-Message-State: AC+VfDwbC2/C3RNt2+MyXthDxoxVESvnGbfuJHFCm8H7b8mjn053duIT
	0Cmi7bzg7ONCpbGOA61/yjw=
X-Google-Smtp-Source: ACHHUZ7Xq1sZH47pNrsamktZ+ZKVyMGi7kuDL7zZxGwL/JJ/n4KR4qPLUyOyVhtiGxlWvPVgPOzNxA==
X-Received: by 2002:a17:907:608c:b0:933:868:413a with SMTP id ht12-20020a170907608c00b009330868413amr4349728ejc.15.1685885153871;
        Sun, 04 Jun 2023 06:25:53 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id x13-20020a170906710d00b0096f694609f3sm3098369ejj.31.2023.06.04.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 06:25:53 -0700 (PDT)
Date: Sun, 4 Jun 2023 16:25:50 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20230604132550.zi32bvniqg7ztd5o@skbuf>
References: <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
 <20230526130145.7wg75yoe6ut4na7g@skbuf>
 <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
 <ZHsxdQZLkP/+5TF0@shell.armlinux.org.uk>
 <826fd2fc-fbf8-dab7-9c90-b726d15e2983@arinc9.com>
 <ZHyA/AmXmCxO6YMq@shell.armlinux.org.uk>
 <20230604125517.fwqh2uxzvsa7n5hu@skbuf>
 <ZHyMezyKizkz2+Wg@shell.armlinux.org.uk>
 <d269ac88-9923-c00c-8047-cc8c9f94ef2c@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d269ac88-9923-c00c-8047-cc8c9f94ef2c@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_062556_255274_7AD5819E 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 04:14:31PM +0300, Arınç ÜNAL wrote:
> On 4.06.2023 16:07, Russell King (Oracle) wrote:
> > On Sun, Jun 04, 2023 at 03:55:17PM +0300, Vladimir Oltean wrote:
> > > On Sun, Jun 04, 2023 at 01:18:04PM +0100, Russell King (Oracle) wrote:
> > > > I don't remember whether Vladimir's firmware validator will fail for
> > > > mt753x if CPU ports are not fully described, but that would be well
> > > > worth checking. If it does, then we can be confident that phylink
> > > > will always be used, and those bypassing calls should not be necessary.
> > > 
> > > It does, I've just retested this:
> > > 
> > > [    8.469152] mscc_felix 0000:00:00.5: OF node /soc/pcie@1f0000000/ethernet-switch@0,5/ports/port@4 of CPU port 4 lacks the required "phy-handle", "fixed-link" or "managed" properties
> > > [    8.494571] mscc_felix 0000:00:00.5: error -EINVAL: Failed to register DSA switch
> > > [    8.502151] mscc_felix: probe of 0000:00:00.5 failed with error -22
> > 
> > ... which isn't listed in dsa_switches_apply_workarounds[], and
> > neither is mt753x. Thanks.
> > 
> > So, that should be sufficient to know that the CPU port will always
> > properly described, and thus bypassing phylink in mt753x for the CPU
> > port should not be necessary.
> 
> Perfect! If I understand correctly, there's this code - specific to MT7531
> and MT7988 ports being used as CPU ports - which runs in addition to what's
> in mt753x_phylink_mac_config():
> 
> 	mt7530_write(priv, MT7530_PMCR_P(port),
> 		     PMCR_CPU_PORT_SETTING(priv->id));
> 
> This should be put on mt753x_phylink_mac_config(), under priv->id ==
> ID_MT7531, priv->id == ID_MT7988, and dsa_is_cpu_port(ds, port) checks?
> 
> Arınç

Given that mt753x_phylink_mac_config() and mt753x_phylink_mac_link_up() also
both modifies MT7530_PMCR_P(port), have you studied the code to see what
really is changed compared to what's in the PMCR_CPU_PORT_SETTING() macro,
after both phylink methods have run?

