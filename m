Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB94EC88E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=; b=buBm2airiI3qF3dzy1tv7uqFj8
	U0IPRD5NCTp6i8WyqAiZqSowKtR0dvql5zys+BVPKvvGnhTHud5BD2Y+Q4GIaaVzdjd25vaq3Mfe5
	PYD+7W0/Oys4w/h5C5aymqm3cOMymgbCdR/0SnfSZtkuLG6qCyi6dPTpGdXFXjaW3dWouaZ8zQVH7
	mXE+otX+XnIKWmqiSDxZ+zqjVu7nQQg0BtH6IFCJUz1+SWRQsC/5TRR6g4ML2lI37i1Z29HFCN0fi
	hGOLTqx7+/msP5/qRhRe+22S/p/y3hZ3ASZYaUOB/dBXB8OAli4htlliI9vdrERh9PU090bWaH3EU
	pqD6Ta7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Jq-00000003v24-35Cf;
	Mon, 14 Sep 2026 14:06:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Jo-00000003v1U-3OjL
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 14:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789394759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
	b=I0nmf85DJx2baVFsROsP9piGdHzG4rYDDGZvOCaLghATJysa1Quu3gF37TBk1Z/Me8641A
	3KlJIXIwLDwnDaF+cACqvOcTpw+3v/rEOLVSE2/3qsR/aXqkBHXT8MAB2dij85E3x4+4x4
	LW4soArvszizVPXjw/HRsbud5qwApN4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-I5wRsal3PUGlc5Mq8J_gng-1; Mon, 14 Sep 2026 10:05:58 -0400
X-MC-Unique: I5wRsal3PUGlc5Mq8J_gng-1
X-Mimecast-MFC-AGG-ID: I5wRsal3PUGlc5Mq8J_gng_1789394758
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so629654585a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 07:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394758; x=1789999558;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=DRDwGjDbjyMY4ql0hj93Extl4zPW2vorM25Sf11mIC5MPoybEk03tYqGcY0XJG+bWd
         A4EwyMfyTj56QHznDM8qY2veuf89pdHzi2Xlp7mZI66wCzsUoW4No8DKJlOoET6Bd/7d
         WQexBgK+xOqaeoFtbTedXcWmkXud2J07vUa6ZDAM6WZI3y1yVqgbUSPzd7IKF7NUK6gA
         JA9kZfN0TwPu3xl1UdpcX71GL9SO51/0ghjTNTw8ktoFFDDsJgHOS9JLkBgw6ZHNIeHN
         o+j0hkHJTCXczkDi1rJCDnPWDcRoppidoCfsQekJneJekU8jbadY9AVO16BCqRb5+mkN
         zuqg==
X-Forwarded-Encrypted: i=1; AKwUvByrz9T97SmgeB6EeRSVV0WB7jZgd8taOBReoh9pPDQcUe7jXFs44F+yPUnTYQvKb79lrHWPL7SxM6Kuag5Jzw==@lists.infradead.org
X-Gm-Message-State: AFuF++ltw92GoVdIgfs2PVCeaUMG0xIOmItry2oveW2hLGBO3IhPFD/f
	nMSuXJAMB7uN8t/RKKN9kNWbyhVe3YIqH8e97OSQHX8NsQlMThILGcHImp9uluXPRRdHRSVg8Hl
	0fUEIHNr/NWYrF/qRr6s4XXiP+z39UfsyUzB8HOWXs2+gjbcmnNUH0de7e7Xxu8xhpfI49h6Wew
	==
X-Gm-Gg: AYBFou1+TBqygrZ9Om6e8/lH7i6TknK9q4ueNiqRFdPuwce3LsOQQfF75r9NV2d7wLs
	hV9zoymJq37FLskVRWXYI6Wtxy1BOJBdCpPKOMnFLR6q2pEiKeQitu/IizVEchpPR4oa4uUCIC6
	10H8/jPgK0EpAEEjcypxQV4oAlpqAWOs8gxJGqD2SmECIAgWTLq8GTsHO6K7Kr6CJJ4a/pf3avA
	wdRtuVxH6r3XXoUpAy+L/sqFF9m5xieZd8bS1tCaqQoL0k7nUlIVwcsu+T/h2mobJIbBlHtwpzL
	E2UA5D3GnaRa2sfn3ZBEcTwn8Ohs97/GzG7oEai5a5Gk41ySmw7ffXFOTsWw7T7DN1od7FZD9G2
	ae9KXFZR++L1rwEFR3KhGJbBa/v9+Ykpy4Rs=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389773285a.16.1789394757365;
        Mon, 14 Sep 2026 07:05:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389765885a.16.1789394756851;
        Mon, 14 Sep 2026 07:05:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm906151985a.43.2026.09.14.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:05:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf_QZpOIj-170Am@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
 <aqf6NH-xrMtCQppv@redhat.com>
 <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
MIME-Version: 1.0
In-Reply-To: <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OWrwc9weFK1QH10rWbdEu1n2XdXCP83hq4TTaUtJYDo_1789394758
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_070600_919610_89D7F79A 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Angelo,

On Mon, Sep 14, 2026 at 03:48:20PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 15:44, Brian Masney wrote:
> > On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> > > On 7/30/26 20:22, Brian Masney wrote:
> > > > Should there be a new MAINTAINERS entry added? There's currently 221
> > > > files under drivers/clk/mediatek/ and there's currently only one
> > > > mediatek maintainer entry:
> > > > 
> > > >       MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > > > 
> > > > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > > > subsystem maintainer similar to what the other SoC vendors do? Help with
> > > > reviews, send in pulls, etc?
> > > > 
> > > 
> > > I may be able to step in, but I have to check if it's feasible, time-wise, on
> > > my side.
> > > 
> > > Though, that won't happen until mid-September... because, well, I'm about to go
> > > on holiday (in a few days from now).
> > 
> > I'm checking in to see if you would be willing to be clk submaintainer
> > for the MediaTek clk drivers?
> > 
> > Brian
> 
> Time is lacking

I can relate...

> , but I get that one hour from me is more than zero, which is
> a good thing.
> 
> Let's do it.

Thank you. Please send a patch for MAINTAINERS when you get a
chance.

Thanks,

Brian


