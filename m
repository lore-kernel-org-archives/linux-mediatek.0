Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B05C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Su8zTzR2eBMkXZoHn096ACCwuReb2hQXURyH9ZRK9B8=; b=YVt4nWkJiMQ4tRs9PcaCCPeDvn
	grVU+SfhC0WdIlMgreKoDaQibvgp+sI5ATdpfgLwTN4ULlyVwUPsMo49/MLZsLB1mtZmTU6r4UDyi
	bq7ByATwp+K6Ac3TzRgw/jC2H1+fvI7ZlpYqeycWE8hwcgC+u72gRVSEs/MI2KdVZew5eY9dXv1LK
	oale2DrPPmSQDJrnQZOznho48wBq4Ci4LpSqPI/0Z1xyg7lj5/wnlh/1ghbHYIsiC8cryYGJBPbIF
	w7ZUXZoZotzWezHudm2RF+PK79guzv8v8fHw4fZ31DL163FO791IJzSYBerS2RbI8B76TZUvAJSmh
	ARPFi7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPO5-004x1s-PM; Fri, 10 Feb 2023 09:08:09 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPO1-004wrY-MM
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 09:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Su8zTzR2eBMkXZoHn096ACCwuReb2hQXURyH9ZRK9B8=; b=S0VEOQP7B/KfzPcUQM3ziZmqwQ
	iPkfll1AmhFKWsd95JlykBqHgtJu8RKFVySuoNV8tAXt+V7R66439THFvpCoPLlAmpaTIhPJ5pevV
	ImHkq5pqQAR7F+MMNvl43rjkZxnwu9HSLJAaYM0b+xwhskgiyy51vQumSH29+3AlDmzk=;
Received: from p200300daa717ad00b877f5316056673d.dip0.t-ipconnect.de ([2003:da:a717:ad00:b877:f531:6056:673d] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pQPNT-006VcP-EF; Fri, 10 Feb 2023 10:07:31 +0100
Message-ID: <ac497bae-838a-2402-a3a4-79913782ccf1@nbd.name>
Date: Fri, 10 Feb 2023 10:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] wifi: mt76: mt7921: fix rx filter incorrect by drv/fw
 inconsistent
To: Deren Wu <deren.wu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <b9ebeda5d445f66fceb17c48c8251093dfe94c57.1673947063.git.deren.wu@mediatek.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <b9ebeda5d445f66fceb17c48c8251093dfe94c57.1673947063.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_010805_859214_B85D5A79 
X-CRM114-Status: GOOD (  10.38  )
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

On 17.01.23 10:30, Deren Wu wrote:
> From: Neil Chen <yn.chen@mediatek.com>
> 
> The rx filter, in mt7921 series, may be changed in fw operation. There is
> a racing problem if rx filter controlled by both driver and firmware at
> the same time. To avoid this issue, let mt7921 driver set rx filter by new
> command MCU_CE_CMD_SET_RX_FILTER and allow the firmware controlling it
> only.
> 
> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Neil Chen <yn.chen@mediatek.com>
Somebody on github reported that this patch breaks scanning. After 
looking over it once more, I noticed something very odd:
It seems that you are dropping the mac80211 FIF_* -> mt76 filter flags 
conversion and passing mac80211 flags to the firmware by using 
*total_flags as an argument to mt7921_mcu_set_rxfilter.
This does not make any sense to me.

Shouldn't you leave the existing conversion logic in place, and just 
pass the new dev->mt76.rxfilter value to the firmware?

- Felix

