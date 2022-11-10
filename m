Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D16C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuqFxBaxjmGS8vHZWox+dggoZc9OmvY8M2AfXlJU0R8=; b=bEU+yPnfXMKWLLqttd3UyKmV8j
	v7Q3QSiSGBwG2pLuC+0Y8V/RFZ5GTlB+PY51Ax7Si1QKON56oLpmo1ELqQFcXIrRGomCLt+no8jF/
	iBhh4qbkFe/4ivHFulXSJKXq9GIYD6ll2yCCSsF7KzDeaLx0myCzWcTqp664W4zPVBHQUqOerT+fo
	CB+g8LtxkZOmc4gA1rj+pKaPUN01m0RnzaR/5WQ48cBCtzRl19Q3WOKKWpESXmEPa1syJbtNybFfV
	J19UPnFbbonejmUS7GDJkzGyqL6ccg7XdV6UrpK0QgkOVOJEu8uRgueBhiyyybZMq0TAeJNxBC2j1
	E8ioIisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot8Xi-006NUZ-09; Thu, 10 Nov 2022 14:28:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot8XV-006NP9-Ha; Thu, 10 Nov 2022 14:28:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5so1252970wmo.1;
        Thu, 10 Nov 2022 06:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OuqFxBaxjmGS8vHZWox+dggoZc9OmvY8M2AfXlJU0R8=;
        b=ajB4H0a6WchJa0TPWnDA1l/S+VvoZ3Aignfw6CB9Khx3EoOmQz44WmdZiFDiyT8HPr
         vhS2DnKWKgwBwtJFo+8YpY3GPf0zMSsP77e24ilWvDsNMLljfY2XdzU+r3YwiUdUhvwo
         3p3tiRt9l4IGufdRwdmUXmnIhO819CXw3f4UOaO27j65iaa9fA+/kjALT6qJXTJBQxg3
         BRpjuadfyxlv2JM124CSdCzNfP/y+tO83csk4O8EjXIZtxz8p0AQ5SijYXhMqZu5NLqS
         x00/KKWiZ2u5livNVfGkCJUKZFkWtHwe9519WNHg9b58Au8LsukUQ8WYj0qyhEzVD6pT
         fLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuqFxBaxjmGS8vHZWox+dggoZc9OmvY8M2AfXlJU0R8=;
        b=Yi5EP0QPGIPBPSRWBgljBB3mfh6vPPuvm8JBFzuE/nNhoFalRoxfQ6fdbZkNbNzryR
         45eRykoRHVhhYjmGBBis8uqHSTrTjKjLCkuGyMoDmxrevRQ7T9sRWyqecGchlCUwJ7q+
         Q82Vul5SzgPU1L9B8azFG00R6ZmYwL7agcPO7LjYoWKLHvfXZFUnpSDQ0v76PJU9UQd9
         P0dcVmCiZfFiPaUJv86V43PbtZ9IlRNv8AAaGT2xlgRfiLVgcGiJ4Qm7tGQjqNCrbjo6
         9kpMpFvluD5P9q3v1UNthmWfIpebBP7JbxkRtDbH+B4OZJLlzfpyf+77SFSM2TbAKyOu
         SjRw==
X-Gm-Message-State: ACrzQf2eejOaZ9ThoOj77/XAqH7EUb4G4CZ4RL7hCtfeOuhWJjIEVfXV
	WwRG+UF3Nin/Ti2j5UyWuzk=
X-Google-Smtp-Source: AMsMyM7TvV/ACzOcKSosDbshDfkaAHOF9iaM7AWChs0Ym7t4LKZ1i41uQlxxpykDs92oIW1yI12Jkg==
X-Received: by 2002:a05:600c:1994:b0:3cf:7c1e:8227 with SMTP id t20-20020a05600c199400b003cf7c1e8227mr33822528wmq.103.1668090498922;
        Thu, 10 Nov 2022 06:28:18 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id m12-20020a5d6a0c000000b00238df11940fsm16202285wru.16.2022.11.10.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:28:18 -0800 (PST)
Date: Thu, 10 Nov 2022 16:28:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 00/12] Multiqueue + DSA untag support + fixes
 for mtk_eth_soc
Message-ID: <20221110142816.nzy4sb27km7xpctd@skbuf>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_062821_623162_079FAF23 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, Nov 09, 2022 at 05:34:14PM +0100, Felix Fietkau wrote:
> This series contains multiple improvements for mtk_eth_soc:
> 
> On devices with QDMA (MT7621 and newer), multiqueue support is implemented
> by using the SoC's traffic shaper function, which sits on the DMA engine.
> The driver exposes traffic shaper queues as network stack queues and configures
> them to the link speed limit. This fixes an issue where traffic to slower ports
> would drown out traffic to faster ports. It also fixes packet drops and jitter
> when running hardware offloaded traffic alongside traffic from the CPU.
> 
> On MT7622, the DSA tag for MT753x switches can be untagged by the DMA engine,
> which removes the need for header mangling in the DSA tag driver.
> 
> This is implemented by letting DSA skip the tag receive function, if the port
> is passed via metadata dst type METADATA_HW_PORT_MUX
> 
> Also part of this series are a number of fixes to TSO/SG support
> 
> Changes in v2:
> - drop the use of skb vlan tags to pass the port information to the tag driver,
>   use metadata_dst instead
> - fix a small issue in enabling untag

Please split the work and let's concentrate on one thing at a time
without extra noise, for example DSA RX tag processing offload first,
since that needs the most attention.

Also please use ./scripts/get_maintainer.pl when sending patches ;)

