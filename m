Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBA2C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndoPYQl5phK8tHt13nq9IJYJYv7E+XvLq6IbZ9sJpXM=; b=TkwZGnHi33W2IUhsz7/kcG5op2
	3RFf0dQpN5pHtfmiyTfPe2wuJjT2GGPDoGkBNoClxBeMrpKadFcvrlOaP4Rdm530CWnVh9Zx8xyrm
	mblNhNDA1th6fW1KkHg1RoM0YjU0dvRACzxQAcqIS+Hg+rHvx66oy+DpPN+Qtvgny36KhZavad9h2
	owYWHyDiJ8VRDHJPHK8ScxNor7tLYNy8OaWxIrl9mz6X7cPIMs/x5TRDSYQb91JmUiwPg55L7YxXo
	QSSN2RdoyUgzILCv1dlOeXhnUVTpTZi+94vPL5PMXc+9PVgKxhdDHa0JojkplHG5xQZIx1Zac06Dj
	Caju66Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94en-00A80O-JU; Wed, 06 Jul 2022 13:01:29 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94ec-00A7yT-KY
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ndoPYQl5phK8tHt13nq9IJYJYv7E+XvLq6IbZ9sJpXM=; b=oFkjtNg8mrZAEIJvRse5kXsAg/
	grePMbfX0Bro9zPMJZa14N+8duYXXT+eadSinKgi8p01/V/x+qaPRB9D9nOg43wKs1JqfVA61gorp
	Ol9es4aSVpHqxxZnTFb67Z1nfPL2qkfDH7fHnIsY+6IBjdY+XhgBoombgZ5w/twWIeo8=;
Received: from p4ff132a0.dip0.t-ipconnect.de ([79.241.50.160] helo=nf.local)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1o94eS-0006O3-LQ; Wed, 06 Jul 2022 15:01:08 +0200
Message-ID: <a4b4539e-759f-f8db-0e17-de0b07dc8190@nbd.name>
Date: Wed, 6 Jul 2022 15:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] mt76: address4 null frame using fixed rate to trigger WDS
Content-Language: en-US
To: Lian Chen <lian.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Bo Jiao <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20220706090901.88929-1-lian.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220706090901.88929-1-lian.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_060118_990110_CC3DD648 
X-CRM114-Status: UNSURE (   6.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 06.07.22 11:09, Lian Chen wrote:
> From: "lian.chen" <lian.chen@mediatek.com>
> 
> WDS function need address4 package to trigger the AP create wlan0.sta.
> while the address4 null frame is sent at a high rate.
> the AP can not receive it.
> so, using fixed rate to trigger WDS flow.
> 
> Signed-off-by: lian.chen <lian.chen@mediatek.com>
I think it might make more sense to set IEEE80211_TX_CTL_USE_MINRATE in 
the mac80211 function ieee80211_send_4addr_nullfunc().

- Felix

