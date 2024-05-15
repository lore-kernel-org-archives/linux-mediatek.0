Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB7C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGfHdT97q06/TBHLdt84bAk2QjFXy+qL8wCDQ3NgfeQ=; b=1NdAuF/MRqRMaP
	0xBSNyjBZ01e2bVDkWAPwV0MA3MqYpGxwNYATBaARbeyZr/K2oztJgfM1PmVrB5CRlMBPBCgF1eKr
	Nm8fbP+pm+ciCBQ1Ua+1xBiRJeogKA6eQSZx2w5rxcVtmk5Z96h3hzTfiTtXNEpjcGlWDBwHEat2l
	SiMkE0XRx2rC8gFshb9OS1yGBx3MDNYXQ3/ODZnP5sTdVAlzytWnVrYOCJ2GlynL+uOmt+YvVBux7
	KGY/auujHQ2CIkeYfIW4PRpbmWuj+wpkjbqP82Mjg1GveDyCVCjEvFni4BQCVKpdX/WehT2Gv5uO9
	u/7p5ZXy4jph7/r0ABSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Fx-00000000oSR-1my2;
	Wed, 15 May 2024 07:40:57 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Fu-00000000oQo-3PFZ;
	Wed, 15 May 2024 07:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=aGfHdT97q06/TBHLdt84bAk2QjFXy+qL8wCDQ3NgfeQ=;
	t=1715758854; x=1716190854; b=izZ/saYI6+0hRMD6AjPmfoRF7cygAhy+K3NTVuJhrWfpm+8
	dL2D0DVidB3pkl/+08nUXwYXMpEV/cMvJMhzx90raqjh0Jd2pLlBndsAoqnZQb6ooeQyzMHCyNufn
	ZkQBGLVFt840dqX+qOGsWIfyqWRkvnQPRa+oCS3ezc1s5rlrMJb3KEXcPuYg2MmfH6wDqkpFSLmEo
	bxxmXc8EVubBm3wzG8rNi2SLAOhVYnIqGZZruTXFT0XhlfHzOJaclZXcKU5TZheN4ftvRuWNoYhD+
	Tbe4KvVv8OWSpM+SGNwXZedxzTa0grQpHYNNEEDNyzLYGJ+Edegr4UCh6S6+qX5w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s79Fh-00045X-MQ; Wed, 15 May 2024 09:40:41 +0200
Message-ID: <a603a67b-6703-4f63-93ee-98a05c605d02@leemhuis.info>
Date: Wed, 15 May 2024 09:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <6061263.lOV4Wx5bFT@natalenko.name>
 <2341660.ElGaqSPkdT@natalenko.name>
 <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
 <2200096.irdbgypaU6@natalenko.name>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <2200096.irdbgypaU6@natalenko.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715758854;267c0b8a;
X-HE-SMSGID: 1s79Fh-00045X-MQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_004055_028399_4C9F5074 
X-CRM114-Status: GOOD (  10.81  )
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

On 15.05.24 09:15, Oleksandr Natalenko wrote:
> On středa 15. května 2024 8:23:35, SELČ Johannes Berg wrote:
>> On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
>>> Also /cc Johannes because of this commit:
>>>
>>> 6092077ad09ce wifi: mac80211: introduce 'channel request'
>>>
>>> On středa 15. května 2024 0:43:40, SELČ Oleksandr Natalenko wrote:
>>>> Hello Felix, Lorenzo et al.
>>>>
>>>> With v6.9 kernel the following card:
>>>>
>>>> 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax PCI Express Wireless Network Adapter [14c3:7915]
>>>> doesn't work any more. Upon mt7915e module insertion the following splat happens:
>>
>> 6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
>> chanctx ops")? Huh?

FWIW, seems there was and earlier report about this that I missed:
https://lore.kernel.org/all/CAAMvbhGHe4PM5M=JJZRQ2m5_aVZ=4DPG76MT+q5qi3HA+7_wzQ@mail.gmail.com/

> Yes, you are right, this commit is not present in v6.9, and I can find it in the "next" branch only.
> 
> I can also confirm this commit fixes the regression for me.

So all we need to resolve this is to ask Greg to pick up the patch for
the next 6.9.y. release? Then I'll take care of that in a few hours,
unless somebody else does it first or I get some kind of "might be a bad
idea for now" signal from anyone.

Ciao, Thorsten

