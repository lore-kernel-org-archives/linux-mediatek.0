Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6914AC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=; b=J8588VtQa/J0+rpxRd0HiUTVf9
	1am9Ndt5NIqOGyEevQmj+48UrKPP+1JToa2RmaNJKAKBEwUc1CnspweEU6WKCqVbklMdZkHmtsHh7
	0knTJp0xairOgXUpDCTuSeqHSOA59ZhYOvVe3ih6xqvNPTC+h12hPlxzHqFknkw1tD+f0xucA1T5y
	wR5/MeaOvtoR68Shz9w1LIoM0fBDnb9lp7x3HPlPR6l9C5dUvKHzPK3YQjhYlDIV5wn/Bzy/6JDjD
	Fg2rElSj01BY9NV1KTlPIcQ+DajuS6YrFCy1oXC0jWgLS9xnbQ7MnA0nQ+CpKDeczKOwTd0v8YFxj
	emOo+0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paH8z-00ASvA-Uj; Thu, 09 Mar 2023 14:21:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paH7t-00ASMl-6X; Thu, 09 Mar 2023 14:20:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j2so2017123wrh.9;
        Thu, 09 Mar 2023 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678371608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
        b=pQ8rH9hmAvMGPdlWLtsaiCL1tbAk6J5Bet/1wrFc3yD0T50sPxhzJap0s2h/tEDON1
         ZyckrHIm+7bwS9K33CaoBmOEZv2I7afmQGc2Er54g/6BTDs+CyEWTFawrPc5lAPk872n
         dmirs2Ttda4PnqKgROjUd7CIwz9tdnPCkSyzGIlnzIK6bEyGRSqA1H7/Ze090yaenbxK
         iPzeJNvkLQF6jNvmwsa7eHyXANDHZkBWQs6sisMepYXK+3QyecdSDDX0uIOJQsDjVcfx
         gAyo8YDxkCaJ9wJqVQYaGvOmMuszKOMwbyHS/bu+S6gVRzJL6eI6sGaSbulGjMzjlnVQ
         sYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
        b=6DzZp3nIGFGMlm16cyDfhH3cgGODNK9id0K2SPEYKLkT6lBuf6kiioLWMlOkNYmBI1
         G4WnB5MG8VUj3BmajiWiT5Y/1QD4UCXGRd2DBsWpay6oWGKQNXdqxOmg4E4i9pnEiOSd
         8+Bfo4uA0sEk9oV73zZ5nMvZ7OOkKWGqr3hDtHkE0HimmkI9wIL2AnVZtF6a3UjjskAy
         MVaKRNeLwO3jezjgg1p4dxqg9XKi0aUoEevf2+ouCxipnzqCoBDtuA5DAZ0odFei1EAD
         EQAuFbIk5vtYfl0F/sDamEGHRyuKnjMZ2Qd5tVU4utl4n9GCJO0J6B8TcLbK6Dh9Q/XI
         h+xQ==
X-Gm-Message-State: AO0yUKWKdN5mg3JgVNbCBrVMYEg6pdctFmu/ySIPBxPxxxPpnS+6dgYh
	xoG6IELcKYIPrPVHeGpx4k3xSJEWUM4BMRExyEBVG2/dBTjcIA==
X-Google-Smtp-Source: AK7set+Yd9KrImooA6uxrXUVmDh+Rcs9q/1b8CgKBFtf9L4gNgxW+NQjjkIdwpsMyntXGCBQF88sBj/dwaEvM3BdnWg=
X-Received: by 2002:adf:dd4f:0:b0:2c5:5297:1f9a with SMTP id
 u15-20020adfdd4f000000b002c552971f9amr4901402wrm.14.1678371608475; Thu, 09
 Mar 2023 06:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation> <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation> <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc> <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc> <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc> <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc> <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 9 Mar 2023 22:19:55 +0800
Message-ID: <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Sergiu.Moga@microchip.com, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, 
	Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
	joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com, 
	john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com, 
	yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, michal.simek@xilinx.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062013_311075_DEDF1065 
X-CRM114-Status: GOOD (  21.57  )
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

Hi!

On Thu, Mar 9, 2023 at 10:04=E2=80=AFPM Michael Walle <michael@walle.cc> wr=
ote:
>
> Am 2023-03-09 14:54, schrieb Tudor Ambarus:
> > On 09.03.2023 15:33, Michael Walle wrote:
> >>>>> The controllers that can talk in dummy ncycles don't need the
> >>>>> dummy.{buswidth, dtr} fields.
> >>>>>
> >>>>> The controllers that can't talk in dummy cycles, but only on a
> >>>>> "byte"
> >>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
> >>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not
> >>>>> have
> >>>>> the buswidth and dtr info, it can't convert the dummy ncycles to
> >>>>> nbytes.
> >>>>> If he knows only that buswidth is 8, it will convert ncycles to 4
> >>>>> bytes.
> >>>>> If dtr is also specified it converts ncycles to 2 bytes.
> >>>>
> >>>> No they don't need it. Lets take your semper flash and assume it
> >>>> needs
> >>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the
> >>>> mode
> >>>> or dtr setting*. The controller then knows we need 12 clock cycles.
> >>>> It has
> >>>> then to figure out how that can be achieved. E.g. if it can only do
> >>>> the
> >>>> "old" byte programming and is in quad mode, good for it. It will
> >>>> send 6
> >>>> dummy bytes, which will result in 12 dummy clock cycles, because 1
> >>>> byte
> >>>> takes two clock cycles in quad SDR mode. If its in octal mode, send
> >>>> 12
> >>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
> >>>> single bit mode, because it cannot send 1.5 bytes..
> >>>>
> >>>
> >>> You miss the fact that you can have 1-1-4. What buswidth do you use
> >>> for dummy, the address buswidth or the data buswidth?
> >>
> >> Doesn't matter, does it? The driver is free to chose, 1, 4, or
> >> anything
> >> else. You don't sample any data during the dummy phase.
> >> To answer your question: single for instruction, single for address,
> >> whatever you choose for dummy as long as there are ncycles space
> >> between
> >> address and data, and quad for data.
> >
> > Huh? How does the controller chose, based on what?
>
> Based on its own capabilities. It can choose either way. In the end
> what matters is how many clock cycles there are between the address
> and data phase. And you only need to convey that information to the
> SPI controller - your new ncycles.

It does matter. Controller may be designed to actively drive
MOSI/WP/HOLD during single-spi dummy cycles and WP/HOLD
during dual-spi dummy cycles. If the pin modes between the
controller and device mismatched, worst case scenario
the chip may get fried.

--=20
Regards,
Chuanhong Guo

