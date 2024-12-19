Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4676E77184
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2024 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2l2kaTxVgDXZ+WZ5RNly03lP6LWl5fzxLs2ibw+q2ng=; b=JN/A/BvdK9rAiBx9RaK6Dg0VTR
	Q/JH0xheUXotiLfapq2pAn4exIfO3mtaLvoMMXiGmwTG4IYfreTXSc47ssbbex1ZGkL/xoWIwwocC
	2DWmsMUqIT0ZsG/M8P41X+DyL4buBzOjB70i1UoGdk1yAhOCZqB1JmRoWlD3Pz71m/4MPpi6mcm20
	uB+SZi443YFE7uQWGsQd4GBthmhUs3W3b4HT6eO1B6fNjOHUrYS6qGQYT3BehHcLsf1dSh2EDCfh7
	ONtQvctD9cKvVGkzRIF46LZpXhFGO4vm4I8OONfgBXMOw1EU1odRepxqjpd0d70bvcFqsjCQYC/Nv
	94aZm2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOPwF-00000003M9C-2CnX;
	Thu, 19 Dec 2024 23:28:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOPwC-00000003M8Y-4070;
	Thu, 19 Dec 2024 23:28:14 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1487242e87.0;
        Thu, 19 Dec 2024 15:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734650891; x=1735255691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2l2kaTxVgDXZ+WZ5RNly03lP6LWl5fzxLs2ibw+q2ng=;
        b=jU98NZ7I353jH2aSX32cIbnmlkNi/hD7mBdQqN+QQ7jrQjH1AyyBUjT2PQtahmVxJH
         di2v0ZvewXYZmCYl3v5zIkKqILHl+7wg/EHPzg75Ym2W6L1f3oUa5mPkzme6UgOGbGai
         1e67y5vbkoe5AZBGT+uemHVOocvB+1psEVWgi5Dsbuo6hm7RXws+pvJgY+PBr4E+cJ0N
         1tXn20wvfFaLtrESncE1GjFj0ve39LKAU8WLTPduEFF7LHXdsyNGUQb0jMjTYc5xXGiP
         5RJP7dJcOizdenmKDem/lbt7xg49ZxrrvvuQlibP1oqJvi3J/81oM2SJ4yOY8QM734I7
         oQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734650891; x=1735255691;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l2kaTxVgDXZ+WZ5RNly03lP6LWl5fzxLs2ibw+q2ng=;
        b=lOZryBA/xLJRk+gSmsibPaD4taG/lWXfvnhaMTZ1fZoT3NKn4z4Jc9BPPX+NaL2IoC
         1mXK4D+ua+7OzS48Ss8QimUEQcM5jEQGV++3+QC7jtDmMPHEmTSleN5rHbU6R0KC8S02
         xZgXpPDZ8hh5/3OuGqA29HpnSAub02IDv+BR6XiZrUfCGHMDq9kgm9JQMsaPXxywxIxW
         ClZo98q2Y4YzY6lIF18qCOBU2pKShxbmA/wJy3N1wal8LKJp4hBJ8G2ABBPcuejPfOgS
         Ts6YsDPqeqz41l3QVb/PDFTvDct+V0OMCIz6wEwZcN8PriCgBGdEDm88y/Xw2Mm94ATc
         orGw==
X-Forwarded-Encrypted: i=1; AJvYcCUmaEW7we3J5La1UlwyXM+z2qAC1GVBI+ip96Lfkd1OBtSqvnkM4v88M11FNFX6+IdiO4lkCBa0lzO8sRuswH0=@lists.infradead.org, AJvYcCW/r40A3TvXkoDbFZlvy17xFFmdczeTwmFexxu1+6XH1gr8PAONzaNU6rXmSqqggERlqJRaKwzpuCDWOT4V3teX@lists.infradead.org
X-Gm-Message-State: AOJu0YxDwXsxPFIhiIbhnEKYRBD9gHoJ4R2/XhhhPD0iUm3u0P7No01o
	FtDQZIqHT7VyIy+2X8SULkSTGx/lNKk7D3K9FWaBv+tWYdYkO76V
X-Gm-Gg: ASbGncvBTb9ioTgX0qSZZJ1aONBePXdEyH5vEyTjp9o2EHO9bNFHQ3aHrQffa7f8DGN
	5H2pKJctgxRg1X5yk/MZkDmHqBeRP7Bvb0M7hqTWkDcexVIXe3wWk8K0C/EMcCGEijgi426D407
	TS7nQH73qJtWUFyp7q0wONLWv3ojY1KMy3aXbm4g4QFElm9hs04AkAX24t/y7/5tvuoZ1+YkV8X
	7d4QMoBUFu6yUOD2g0b4LXv9Rkq2rkVS8/tFHUj8gPCHM5hEB+g2w5OVwRbJtjneghZM5dUSg==
X-Google-Smtp-Source: AGHT+IHwtq2DRxGiJpJfSQ3Ioq7kVn6TqoQxNI6STyt5mABoqAAJc/qvM+8M8/76Be/3GE/r3d1tWQ==
X-Received: by 2002:a05:6512:a93:b0:542:215f:e615 with SMTP id 2adb3069b0e04-54229450a3bmr193154e87.16.1734650890368;
        Thu, 19 Dec 2024 15:28:10 -0800 (PST)
Received: from foxbook (adtk139.neoplus.adsl.tpnet.pl. [79.185.222.139])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422360075dsm310172e87.104.2024.12.19.15.28.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 19 Dec 2024 15:28:08 -0800 (PST)
Date: Fri, 20 Dec 2024 00:27:59 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: aleksander.lobakin@intel.com
Cc: Bo.Jiao@mediatek.com, StanleyYP.Wang@mediatek.com,
 alexander.deucher@amd.com, andrew+netdev@lunn.ch, andrew@lunn.ch,
 angelogioacchino.delregno@collabora.com, apais@linux.microsoft.com,
 chui-hao.chiu@mediatek.com, cug_yangyuancong@hotmail.com,
 daniel@makrotopia.org, davem@davemloft.net, deren.wu@mediatek.com,
 dokyungs@yonsei.ac.kr, dsahern@kernel.org, dzm91@hust.edu.cn,
 edumazet@google.com, gch981213@gmail.com, git@qrsnap.io,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com,
 gustavoars@kernel.org, helmut.schaa@googlemail.com, horms@kernel.org,
 jiefeng_li@hust.edu.cn, keescook@chromium.org, kuba@kernel.org,
 kvalo@codeaurora.org, kvalo@kernel.org, leit@fb.com, leitao@debian.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, lorenzo.bianconi83@gmail.com,
 lorenzo.bianconi@redhat.com, lorenzo@kernel.org, lynxis@fe80.eu,
 mailhol.vincent@wanadoo.fr, markus.theil@tu-ilmenau.de,
 matthias.bgg@gmail.com, mikhail.v.gavrilov@gmail.com,
 mingyen.hsieh@mediatek.com, mrkiko.rs@gmail.com, nbd@nbd.name,
 nelson.yu@mediatek.com, netdev@vger.kernel.org, oliver@neukum.org,
 pabeni@redhat.com, quan.zhou@mediatek.com, raoxu@uniontech.com,
 rodrigo.vivi@intel.com, romain.perier@gmail.com, rong.yan@mediatek.com,
 ryder.lee@mediatek.com, sean.wang@mediatek.com, sgruszka@redhat.com,
 shayne.chen@mediatek.com, sidhayn@gmail.com, stern@rowland.harvard.edu,
 stf_xl@wp.pl, sujuan.chen@mediatek.com, wang.zhao@mediatek.com,
 wangyuli@uniontech.com, weiwan@google.com, woojung.huh@microchip.com,
 yn.chen@mediatek.com, zhanjun@uniontech.com
Subject: Re: mt76: dealing with disconnections, -ENODEV and -EPROTO
Message-ID: <20241220002759.34dcfe11@foxbook>
In-Reply-To: <a2bbdfb4-19ed-461e-a14b-e91a5636cc77@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_152812_996011_7AFDC55D 
X-CRM114-Status: GOOD (  15.89  )
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

> >  		ret = usb_control_msg(udev, pipe, req, req_type, val,
> >  				      offset, buf, len, MT_VEND_REQ_TOUT_MS);
> > -		if (ret == -ENODEV)
> > +		if (ret == -ENODEV || ret == -EPROTO)
> >  			set_bit(MT76_REMOVED, &dev->phy.state);
> > -		if (ret >= 0 || ret == -ENODEV)
> > +		if (ret >= 0 || ret == -ENODEV || ret == -EPROTO)
> >  			return ret;
> >  		usleep_range(5000, 10000);
> 
> How do other drivers handle this?
> Can -EPROTO happen in other cases, not only unplugging, which this
> patch would break?

Yes, -EPROTO may be a transient error, although they are relatively
rare as some retries are done before the URB fails. This patch will
only break things if things work in the first place, i.e. the driver
has sensible retry policies, the hardware doesn't get confused, etc.

Note that -EPROTO is not guaranteed in this case, see
Documentation/driver-api/usb/error-codes.rst

I know that xHCI gives -EPROTO and it looks like EHCI does too (IDK
if this is reliable), but I just checked that OHCI gives -ETIME.


I don't have this hardware, but I played with some other wired/WiFi
dongles and observed similar problems of varying severity.

It looks to me like USB core doesn't actually return -ENODEV on
disconnected devices, or at least doesn't react to disconnection
until .probe() returns, I am not yet sure which of those.

And drivers don't seem to expect -EPROTO or -ETIME to be fatal.

And maybe they should, if they wouldn't be able to recover from it
anyway, and I know that there are drivers which can't. But I think
this USB subsystem behavior is suboptimal too.

Regards,
Michal

