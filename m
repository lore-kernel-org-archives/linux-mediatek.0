Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D72C35FF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HST9OpIy3x68Lk4v6EQj7GCYN2CImIYndaq80kHZXJM=; b=SA5zfBPadRBM6jo8nbEqIonZFK
	KviStLB/mNO0Tblij56tD7uOUhQaF5EXIbnq/v1lZ8yUp9v2vaqcNPXa9U/v+liExRAVQd9knS3sP
	QIGLnpbCnkXHME8GxzcUlubESigHYKzsn29vN+LvE/h4lXg11G2pkdZfpfE0sWksj+QdduEJu4/1X
	JPFBJHiM9qvKnpVpNZrKPxQU6XXUZGJLrMlbLfQUVfsLn44z63a4/64WfN1I1q5lO18W//6exC0e5
	+Ooc/A04nsLk7/Qw/8IKn63wd+xHih0NS230VYARLOweI8Hocx3KSRsBd2ZobqwmyILtNhh+SNUrE
	6t2yJCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUJg-00000005np8-3kl2;
	Tue, 17 Sep 2024 09:16:12 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUJR-00000005nhj-3JL9;
	Tue, 17 Sep 2024 09:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HST9OpIy3x68Lk4v6EQj7GCYN2CImIYndaq80kHZXJM=; b=Qnt0MWAhTxV2cyna1zORX+ShPB
	8W5L8IOtlxaZF7Qfq8S3Uv8HQoNv1C12spp+hG2TfEDtwPj+0LA3DIdNrsQ4u10nNv1x2epemyTY2
	dj5Cm6XN73Z3QesBTYYuJw+5U1i+IWGqv9g8ZlnF3JUndZbkyOtdT+S5vCBJba1s0xfg=;
Received: from p4ff1376f.dip0.t-ipconnect.de ([79.241.55.111] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sqUJA-00EK9i-08;
	Tue, 17 Sep 2024 11:15:40 +0200
Message-ID: <b8e11bbc-c718-4acf-acc0-6b31f25fae27@nbd.name>
Date: Tue, 17 Sep 2024 11:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG and WARNINGs from mt7921s on next-20240916
To: Kalle Valo <kvalo@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu
 <deren.wu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ma Ke <make24@iscas.ac.cn>,
 regressions@lists.linux.dev
References: <144fbf79-950c-4cd1-bc68-4e00b47b03e9@gmail.com>
 <ZujCwvd4XiwljDyv@lore-desk> <87ldzqdcsv.fsf@kernel.org>
From: Felix Fietkau <nbd@nbd.name>
Content-Language: en-US
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <87ldzqdcsv.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_021557_967575_B38E1E85 
X-CRM114-Status: GOOD (  13.35  )
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

On 17.09.24 08:17, Kalle Valo wrote:
> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> 
>>> Hi,
>>> 
>>> I ran into some bug messages while testing linux-next on a MT8186
>>> Magneton Chromebook (mt8186-corsola-magneton-sku393218). It boots 
>>> to the OS, but at least Wi-Fi and Bluetooth are unavailable.
>>> 
>>> As a start, I tried reverting commit abbd838c579e ("Merge tag 
>>> 'mt76-for-kvalo-2024-09-06' of https://github.com/nbd168/wireless")
>>> and it works fine after that. Didn't have time to do a full bisect, 
>>> but will try if nobody has any immediate opinions.
>>> 
>>> There are a few traces, here's some select lines to catch your attention,
>>> not sure how informational they are:
>>> 
>>> [   16.040525] kernel BUG at net/core/skbuff.c:2268!
>>> [   16.040531] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>>> [ 16.040803] CPU: 3 UID: 0 PID: 526 Comm: mt76-sdio-txrx Not tainted
>>> 6.11.0-next-20240916-deb-00002-g7b544e01c649 #1
>>> [   16.040897] Call trace:
>>> [   16.040899]  pskb_expand_head+0x2b0/0x3c0
>>> [   16.040905]  mt76s_tx_run_queue+0x274/0x410 [mt76_sdio]
>>> [   16.040909]  mt76s_txrx_worker+0xe4/0xac8 [mt76_sdio]
>>> [   16.040914]  mt7921s_txrx_worker+0x98/0x1e0 [mt7921s]
>>> [   16.040924]  __mt76_worker_fn+0x80/0x128 [mt76]
>>> [   16.040934]  kthread+0xe8/0xf8
>>> [   16.040940]  ret_from_fork+0x10/0x20
>>
>> Hi,
>>
>> I guess this issue has been introduced by the following commit:
>>
>> commit 3688c18b65aeb2a1f2fde108400afbab129a8cc1
>> Author: Felix Fietkau <nbd@nbd.name>
>> Date:   Tue Aug 27 11:30:01 2024 +0200                  
>>
>>     wifi: mt76: mt7915: retry mcu messages                                            
>>                         
>>     In some cases MCU messages can get lost. Instead of failing completely,
>>     attempt to recover by re-sending them.
>>      
>>     Link: https://patch.msgid.link/20240827093011.18621-14-nbd@nbd.name
>>     Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>
>>
>> In particular, skb_get() in mt76_mcu_skb_send_and_get_msg() is bumping skb users
>> refcount (making the skb shared) and pskb_expand_head() (run by __skb_grow() in
>> mt76s_tx_run_queue()) does not like shared skbs.
>>
>> @Felix: any input on it?

Sorry about that. Please try this patch, it should probably resolve this issue:

---
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -84,13 +84,15 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
  	mutex_lock(&dev->mcu.mutex);
  
  	if (dev->mcu_ops->mcu_skb_prepare_msg) {
+		orig_skb = skb;
  		ret = dev->mcu_ops->mcu_skb_prepare_msg(dev, skb, cmd, &seq);
  		if (ret < 0)
  			goto out;
  	}
  
  retry:
-	orig_skb = skb_get(skb);
+	if (orig_skb)
+		skb_get(orig_skb);
  	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, &seq);
  	if (ret < 0)
  		goto out;
@@ -105,7 +107,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
  	do {
  		skb = mt76_mcu_get_response(dev, expires);
  		if (!skb && !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
-		    retry++ < dev->mcu_ops->max_retry) {
+		    orig_skb && retry++ < dev->mcu_ops->max_retry) {
  			dev_err(dev->dev, "Retry message %08x (seq %d)\n",
  				cmd, seq);
  			skb = orig_skb;


