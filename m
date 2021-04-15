Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96870C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 10:06:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DBA6137D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 10:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08DBA6137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:MIME-Version:
	References:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaveASFVIcATNiexnrKolInFJtGkKb+Nu4kQJve+798=; b=T/EGEiFMLlQfni
	4wa1MjhE4OfFOVYKBNl0josrKa69vaTHFs31ZS787Bs/gx9G7SEDmMDg3AaIXYjbBoS57NbQmYVd2
	9hX3fRJJfNOlTLRisWpEZsTvFdIudjeFCdRibYIbgXHc9bRR6DDc4PbJzs/qPLH9oNWz7OJiu+N9o
	pY2pb50qeCYV54MlngpaoGlflER2fw5a02naGQmKYrnYm/FzoqZg/yelojQt3XKtKFr6EUGYoa1N0
	Hk9G/zhdrrNZwZYAYfhBrg9AM+erS5AFzuB+nij8PpB41JIX7n+rc/3pZgua0GAutC9FB6UwaOoIg
	AkAIqdYesiOgktQEy7rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWysr-00FeRz-1R; Thu, 15 Apr 2021 10:06:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWysp-00FeRW-Sm; Thu, 15 Apr 2021 10:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=+kUA0a4ZwMlKKIjn9JGeCEsofiYmSw4pSDq5hmtIq2I=; b=DvhZnzyrWM5Uyvf2n5Z7D3G7yu
 IT0M5prYA1FAk2ZTLHOpb+R7UZkynEZoxfdQQNAa3IllqAHQxGZsH5Hx8mM5rsH6T6dwErSUSvTYL
 zxGaEFL+Y+MO4BhLI+oa12RiaVxz7Nsksoshagw5RPLudfMgFpKfSN/lzWYJJIVJBmXJ7s+s6+4CH
 Pu3O3x3XlAUzFmxfB2LVBPaYK2jUgfocSa3trzgnkjbvFNZIWB/FWMH9fYwkF1APRMCr+WFA+ffYR
 mFx/kLCdZ/4A5Z587VUJlqNz3MHqbIPOjfv+ZuJfZbD70Nf2/YNQNIjNxIS4d8m8zcZElI3k3JNC8
 buVanKRA==;
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWysn-008SFx-3S; Thu, 15 Apr 2021 10:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1618481132;
 bh=+kUA0a4ZwMlKKIjn9JGeCEsofiYmSw4pSDq5hmtIq2I=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:CC:From;
 b=QuPPBRiENJoCcijPjvZcehy4ig2VOX3F66I2kOgs/vJFAbu8+rKBAGMfkS9y51vXB
 Qn5gDOQSDEvgZWUuNQ5EEFtH81pRpUqBh0iC6+KQptIxJ/1CigUqydmPRjMQR9EMfV
 8SSnKuex4gojzwa1SAAqkMBNtVSmJDEWCYsEXDh8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.79.33]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMyZ-1lBLGH0N3x-00MIeU; Thu, 15
 Apr 2021 12:05:32 +0200
Date: Thu, 15 Apr 2021 12:05:26 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20210415094005.2673-1-dqfext@gmail.com>
References: <20210415094005.2673-1-dqfext@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mediatek: fix typo in offload code
To: linux-mediatek@lists.infradead.org, DENG Qingfang <dqfext@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
CC: Alex Ryabchenko <d3adme4t@gmail.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <86DA3F5B-32B2-446B-B83D-AFDC5EE6BF53@public-files.de>
X-Provags-ID: V03:K1:PlTSyeEjvd5QpR+8/glb3oZRAAoeP/sVZ46rDI8ff51bte7qAzo
 0y2loCGZIEppur0KEOWHSPNx8Y9tDeluhuV/o4OqnexoiTupD728MW1s2fpWZKDBuxOvXfb
 C/vrQFUlaGuEhSHV/Gx7EM64seFRytvCQFMaQu8S9QIUd5pDZ2TZvfgBDdmNf9K6zt1bbxJ
 iuY9NS+J6LMaZX07t2W2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LO/CZ9QTzDI=:TYoFxZWYwdEgCCGxcK3MPf
 i0vOKpwaIvIrvkV1M0tkhAKn7sKMGNM9MpwEM9N79U05yJ7fh7KDk6ytrZCeoTEkEeu/p9hUz
 zFUP+jIKSB7OkeKUGdF+HJEblIFk4jZknfZtUCtVVyA77U8gL6aVsV0Fd3TsJNCNvTHAbOVFN
 xYh1G+Je+q6EapArZY9YWSKJw+Za2MXSWZYcuqF3QJHwRm5RekNw1lSO5ihVcavLu4NNKW/hz
 fIXKxYK/h4VaPK2ZQ7l4JwrnK70w2MtKTeOUsN1KNRZ8GBqE7Z+hKUJBUD2yzrmiSQZ9ycD5M
 lUc/m7UGN7b4bC+Z0ODNfwdSm4f1ghEB7G0dCUffelaFN9x1mRhnFuuDoziX6hQneCKVt+CoS
 KenOiEcQt8w44+rJ8T9DpGvszeuC8MzOHZSF5/u/WV5XSxh8L0V0xlsAw3dyWa03figFU8Js1
 +8wSayeVS/hGr2KPxksqF/xIQ4GTg7cw7Meu9/LHvVwrMty//jzV+ItunAWrYBcqjztkqraMN
 oSUGTlxlYSdISUd9UZdtHRr+nIfSwtQVWcwvR1bIV0TQfnWEXG9dx+enkG0u9rhwiKztKppb5
 iNyydbFT5EqfR4Yz19WhIzukxwMZnH0aO5xrfXLO//Rz+FmeUER/hghpdGWoDxJQawi/WeJDr
 rszR7gnOwXj0HyQTDPwgQQ8bpEr8FVf6M5suG+EtMx2XXruZkdB1grvFX4f1GmnlF1m0aHfN4
 HmN086lOjt8gZocbSS8mB+pythc2ptrT8ZxuhyzBFubW2Tp0r2d+mgGYa4joZFhhDCu2XMfJ4
 IK+VPsx4dukuWSeI2P8IRUxbmoBETGdiYbKG9G0ZE1rmOtmqY4zFp7HLlkNCa/YJkIa5xYDVl
 r/XB4XLFkBupHKz0JLfMs1CgjsTXjdAhuNGupbi+nekHtj+siSV6pMdmbl+2tFs8/bWeF+blA
 LGZsR0wHfG1hix/WzpiHNuT0Ct59EUEmq6y/hQxorW7Gv3uYFx8Gp/ej6ivoaKqjp7r5ChNCJ
 +Sa4UKwUeYGQ91oCRcqNc4jOJsFR9KobtIqot9f3jNS7ZBwIpDu++c9fbIH+vRjdXcyN+C29D
 pAlOnygQnwO4m6rFW26M+b60irT9wQqUF+LWYIPQ6H8fnQ0M2BDMJAjfxcR88HKfwc4cozygB
 G6yaHjWcfuQR7Lg8CPSnnz4zCwQDsVplG8XQH+gTiuYhGtGsjWyzodKEAF/no2UMobZIYpyzf
 5eB6pZ2/vrYv3/I6K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_030557_503890_44ECC3EB 
X-CRM114-Status: UNSURE (   6.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 15. April 2021 11:40:05 MESZ schrieb DENG Qingfang <dqfext@gmail.com>:
>.key_offset was assigned to .head_offset instead. Fix the typo.
>
>Fixes: 502e84e2382d ("net: ethernet: mtk_eth_soc: add flow offloading
>support")
>Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Thanks for posting the fix,but imho commit-message is not good.

Issue were traffic problems after a while with increased ping times if flow offload is active.

It turns out that key_offset with cookie is needed in rhashtable_params and head_offset was defined twice.
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
