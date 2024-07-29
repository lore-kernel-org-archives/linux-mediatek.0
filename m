Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED1C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRwq4iryWCGtxaVXelfLfM8LtnioMELn/jHh8pE2A+Q=; b=RayN/X3GHjqvFP
	GZSvUJSZFNo04aEZG8RhLUAPcV7MpLqvcK3CSMbEZ5VOjwa0iKGiwDJMOcBv8Xanacbw6biCfoxFO
	hIpAUQgDDE2szvOpqGIDkG4hwVYnKTAwCOZdGX78DNCa/NbpEr6OMsLsiHLnu9bmjrisDzR9HjZmz
	LZkHwPnANc1M7/DAVhLdjzx2XKPDNHeKc16ytT98YmroKS//rW1yYV7JM/HNZPetcBKc3jDch3vWb
	DmWSD/qxdqEWczz40OFf75ArCZtUvDJt78GdUFpt8wiL/3Al/U/fIOoMBisZbLkKQ4dZN/aYp5vl+
	onztCkY98+uuarUYuzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQlS-0000000BToA-2AQ2;
	Mon, 29 Jul 2024 13:50:14 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQlP-0000000BTkm-03d2
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 13:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=HRwq4iryWCGtxaVXelfLfM8LtnioMELn/jHh8pE2A+Q=;
	t=1722261011; x=1722693011; b=OCiPTlKQHeGFSZUUN00dwBge07iOl/1C1qozXEdA1wd1VRk
	sO2xTVsP+9tsy5K4yZ8Hu4MIPg7qTBc2SXrhD4VD6GnD/43hM6sSPI8m46P/hQ56NTt+O9FLRei4I
	risJlksHiusAoG7Q9v2nEk4wBLVgA+e4JHOb2P6+2wyhR1aDti+2J7bbutRK/EzgdqjlPEbyIihhw
	yGVxR83uyaS0HEOyqoRrI147z0lbNGaC6YD57wqzFPy4F1O37Yy3JhOuSya/lpxqJatdtgDMxyNDW
	IpTseG88/+kIQBDs5Hs0wr8U8jwvhXYdYMaJLQgt6aS+l29VLDRsWk2uog29K6fQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sYQlC-0000uL-Pn; Mon, 29 Jul 2024 15:49:58 +0200
Message-ID: <c6f93f9d-db6e-40c8-9973-18374af08ab1@leemhuis.info>
Date: Mon, 29 Jul 2024 15:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in
 mt792x_mac_link_bss_remove
To: Bert Karwatzki <spasswolf@web.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Mike Lothian <mike@fireburn.co.uk>
References: <20240718234633.12737-1-sean.wang@kernel.org>
 <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
 <81a6dad7119069d446a982d1c7da4fff5726d26b.camel@web.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <81a6dad7119069d446a982d1c7da4fff5726d26b.camel@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722261011;ed95eae0;
X-HE-SMSGID: 1sYQlC-0000uL-Pn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_065011_250050_C69EC013 
X-CRM114-Status: UNSURE (   7.89  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29.07.24 12:51, Bert Karwatzki wrote:
> Am Mittwoch, dem 24.07.2024 um 11:36 +0200 schrieb Linux regression tracking
> (Thorsten Leemhuis):
>>
>> On 19.07.24 01:46, sean.wang@kernel.org wrote:
>>> From: Sean Wang <sean.wang@mediatek.com>
>>>
>>> Fix null pointer access in mt792x_mac_link_bss_remove.
>>>
>>> To prevent null pointer access, we should assign the vif to bss_conf in
>>> mt7921_add_interface. This ensures that subsequent operations on the BSS
>>> can properly reference the correct vif.
>>>
>>> [...]
>>>> Fixes: 1541d63c5fe2 ("wifi: mt76: mt7925: add
>> mt7925_mac_link_bss_remove to remove per-link BSS")
>>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>>> Closes: https://lore.kernel.org/linux-wireless/2fee61f8c903d02a900ca3188c3742c7effd102e.camel@web.de/#b
>>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>>
>> TWIMC, Mike (now CCed) ran into the problem and on bugzilla confirmed
>> that this fixes the problem:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=219084
>> https://lore.kernel.org/all/CAHbf0-HOS-jdRGvJOBmEgaaox3PDbDSTgnnZkZF9pz37Bmh2iw@mail.gmail.com/
> 
> Unfortunately this NULL pointer dereference made it into linux-6.11-rc1.

Thx for letting us known. Seems this happened due to unlucky timing. But
the fix afaics will be part of this weeks -net pull , so it should be
fixed by -rc2 unless something odd happens. Ciao, Thorsten

