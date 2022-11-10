Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2102BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4WgWvq7LeWC54KLFtoLJVFPenyJUDyOFYsB574niLI=; b=MjVLOP+k125r9ReL6bMjC1ntb/
	lrXpJolONyrp/rxbxXVMh2H8Sew98si+JOvKJzFALa1wlrsncHXef/IkMMIaUy51NVlvqfUm1BnoH
	0wA6QqBzL3l9rc//DLCB4kD7fM/edC3wbYepuTOFrKwU4ekknT0zMsfCvvgVEtyG/5GI7mGzCtKTW
	nU0KGRUZvMi5MlmznvXXuQtps2T3yPsj72sWkShEGQaz9MWgLBtfhXUoDvzYuDRDqFpZn40ek9Wnb
	iPMEquGYgKR+A8oxdGrhQJlJt2+mWvTuMlaqtn2dxfrSmje7fXkCO6IhLvWrBEGVArVIQVv+7MJmM
	2gbcRI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCdx-008Jxz-74; Thu, 10 Nov 2022 18:51:17 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCX8-008FCR-Sz; Thu, 10 Nov 2022 18:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r4WgWvq7LeWC54KLFtoLJVFPenyJUDyOFYsB574niLI=; b=OtEx2/ra0q4bCSHCPWJ552VOfH
	tAxiuL3A4uiMPOV3peFwmADmLpDOMLV2sJdh7SNurcoqIQ31U//7xFM/RWjhmT3wSf+f016ZKUTeo
	Cc2peJuT08P0H+1sOcb5MHxYHpW9aHLhnZdsiJm3BUp+91uBnYq1zJe/J5F7YByg99L8=;
Received: from p200300daa72ee10c199752172ce6dd7a.dip0.t-ipconnect.de ([2003:da:a72e:e10c:1997:5217:2ce6:dd7a] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1otCX6-0010Bz-PZ; Thu, 10 Nov 2022 19:44:12 +0100
Message-ID: <2abbe051-7ddb-e9d6-a477-86555c9ed377@nbd.name>
Date: Thu, 10 Nov 2022 19:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH net-next v2 00/12] Multiqueue + DSA untag support + fixes
 for mtk_eth_soc
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221109163426.76164-1-nbd@nbd.name>
 <20221110142816.nzy4sb27km7xpctd@skbuf>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20221110142816.nzy4sb27km7xpctd@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_104414_988735_2C17AFE3 
X-CRM114-Status: GOOD (  15.60  )
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

On 10.11.22 15:28, Vladimir Oltean wrote:
> On Wed, Nov 09, 2022 at 05:34:14PM +0100, Felix Fietkau wrote:
>> This series contains multiple improvements for mtk_eth_soc:
>> 
>> On devices with QDMA (MT7621 and newer), multiqueue support is implemented
>> by using the SoC's traffic shaper function, which sits on the DMA engine.
>> The driver exposes traffic shaper queues as network stack queues and configures
>> them to the link speed limit. This fixes an issue where traffic to slower ports
>> would drown out traffic to faster ports. It also fixes packet drops and jitter
>> when running hardware offloaded traffic alongside traffic from the CPU.
>> 
>> On MT7622, the DSA tag for MT753x switches can be untagged by the DMA engine,
>> which removes the need for header mangling in the DSA tag driver.
>> 
>> This is implemented by letting DSA skip the tag receive function, if the port
>> is passed via metadata dst type METADATA_HW_PORT_MUX
>> 
>> Also part of this series are a number of fixes to TSO/SG support
>> 
>> Changes in v2:
>> - drop the use of skb vlan tags to pass the port information to the tag driver,
>>   use metadata_dst instead
>> - fix a small issue in enabling untag
> 
> Please split the work and let's concentrate on one thing at a time
> without extra noise, for example DSA RX tag processing offload first,
> since that needs the most attention.
> 
> Also please use ./scripts/get_maintainer.pl when sending patches ;)
I did that. That's where most of the To/Cc's came from.

- Felix

