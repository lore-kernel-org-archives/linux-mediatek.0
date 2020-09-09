Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE5BC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:35:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5653F2087C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtEbfXM/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5653F2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1exHrd5n77veVxUPie20dvjiEX0KFE+dEyahJ5OHlk=; b=GtEbfXM/RsCo4RmDKCJlAFCSo
	hBXmvIQzE/YXSJq+Ls2/+OhgZXrjMBswVtCTrdw9QPp7+ZyMHwrYthSS+34HKFo4QZKNHK95BMhZg
	qn1KiTEv8f0H5zQV4eD01bfsPFTRKSq0waGuSm3AQFypqzbVAH9yWumWI9ik+W+VmnGRkOhoe8PaB
	nKxp+vAHfRMmKJG4ofPSA/mti12SsEvzsZJifTiwYg+h/ioLnnlz2avVwdSYwLHvCNJmcj6vb94BN
	7znDJ41zVe13MWtZjHV/Q0JhszUF6XjzIgrpn+YZ8WfHO6Sbq2BbE9NnsQX+c5jOaNLbDUFdCAZJs
	ssCjhWXgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFwVR-00076N-40; Wed, 09 Sep 2020 09:35:09 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFwVL-00074p-TQ; Wed, 09 Sep 2020 09:35:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87B94ADBD;
 Wed,  9 Sep 2020 09:35:03 +0000 (UTC)
Subject: Re: [PATCH v5 6/7] arm: dts: mt7623: move display nodes to separate
 mt7623n.dtsi
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-7-linux@fw-web.de>
 <57085883-5044-aec2-021b-3b0880da70bc@gmail.com>
Message-ID: <3b3ef297-a3cf-6a3f-3118-9cc8b4ccc1f4@gmail.com>
Date: Wed, 9 Sep 2020 11:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <57085883-5044-aec2-021b-3b0880da70bc@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_053504_499139_96097F30 
X-CRM114-Status: GOOD (  14.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw@amazon.co.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/09/2020 11:29, Matthias Brugger wrote:
> 
> 
> On 19/08/2020 10:17, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> mt7623a has no graphics support so move nodes from generic mt7623.dtsi
>> to mt7623n.dtsi
>>
>> Fixes: 1f6ed224594 ("arm: dts: mt7623: add Mali-450 device node")
>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Applied to v5.9-next/dts32
> 

Realized that there is a v6, so I pull out this and 7/7.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
