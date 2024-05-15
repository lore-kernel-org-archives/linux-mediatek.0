Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F14BC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge8e4h3UMypPCIdfQ9dILMu/Uub24xtFTsawJKyXGXA=; b=tegjBFJPIvUsOB372ruuZIMwuU
	+QbmOzizT0CqoiKfqfXsllc8y7W2vskEFu6vZAWhXCImHqYz1+gucAw+fCAlkL87/hOaLzharGGBD
	EQeK/oaxtLGzE/H//4QV2DaZOiVjM9KakFN8zxcMANJq1qrjltysqlwy8GkGwPgLtPaHED1gMfalZ
	PEK8Dfn/hXi6tMDX3KmU7jgiOmY4pDVkYcWSxFrhs3tb454LeH/oA05XXUFGpDpqHqKo1UO1C3bQf
	Xh3XHzcLkfaBNva07PaWRHx37FKmGuOWzuNoj1G+oQp9G8w/0axcFmCgzgZU9XzyIGgSQwVzws6sa
	1H9QHmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Nu-00000000qA6-0NbS;
	Wed, 15 May 2024 07:49:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Np-00000000q78-1DW9;
	Wed, 15 May 2024 07:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF7FC61465;
	Wed, 15 May 2024 07:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6255BC116B1;
	Wed, 15 May 2024 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715759344;
	bh=ge8e4h3UMypPCIdfQ9dILMu/Uub24xtFTsawJKyXGXA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=drzJz1u1/ePj3xCPiPsgyWP2UtQ9Tc2bHK6Fx/miLrBfoqCZd31POrlfy7mi8V4zK
	 deIdpBqlx2zfdxgCIZOCEMwsl7/j7lD7G+PvbiSPqw1SzYINeI/HO04E4AsZegECxN
	 V8qR8CL2MCJYkrhmYOHxQ9BP3HkTZxtpVMZqBizGeNA11X/32nQOdA+rKc0qqhfhs0
	 VCBwc80fx/eyIEl0Nn+IPMce+5Shnjo05AwfxH48bEVLa3ndqatQMppDOFV/W8vfPY
	 k0ROHvuajNuzw5g8Vo1BtnUvpe0wzE5XeA/HKuU21TEdhkjC0yx1Z6r8dqrD+RbrHE
	 LaW5HOfpMNQ6A==
From: Kalle Valo <kvalo@kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org,  linux-wireless@vger.kernel.org,  "Linux
 regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
  Johannes Berg <johannes@sipsolutions.net>,
  linux-mediatek@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Felix Fietkau <nbd@nbd.name>,
  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Peter Chiu <chui-hao.chiu@mediatek.com>,  StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
References: <6061263.lOV4Wx5bFT@natalenko.name>
	<2341660.ElGaqSPkdT@natalenko.name>
	<60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
	<2200096.irdbgypaU6@natalenko.name>
Date: Wed, 15 May 2024 10:48:59 +0300
In-Reply-To: <2200096.irdbgypaU6@natalenko.name> (Oleksandr Natalenko's
	message of "Wed, 15 May 2024 09:15:12 +0200")
Message-ID: <87v83fcy6s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_004905_394936_A5E15B5E 
X-CRM114-Status: GOOD (  13.28  )
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

Oleksandr Natalenko <oleksandr@natalenko.name> writes:

> Hello Johannes.
>
> On st=C5=99eda 15. kv=C4=9Btna 2024 8:23:35, SEL=C4=8C Johannes Berg wrot=
e:
>> On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
>> > Also /cc Johannes because of this commit:
>> >=20
>> > 6092077ad09ce wifi: mac80211: introduce 'channel request'
>> >=20
>> > On st=C5=99eda 15. kv=C4=9Btna 2024 0:43:40, SEL=C4=8C Oleksandr Natal=
enko wrote:
>> > > Hello Felix, Lorenzo et al.
>> > >=20
>> > > With v6.9 kernel the following card:
>> > >=20
>> > > 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax =
PCI Express Wireless Network Adapter [14c3:7915]
>> > >=20
>> > > doesn't work any more. Upon mt7915e module insertion the following s=
plat happens:
>> > >=20
>>=20
>> 6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
>> chanctx ops")? Huh?
>
> Yes, you are right, this commit is not present in v6.9, and I can find it=
 in the "next" branch only.
>
> I can also confirm this commit fixes the regression for me.

Thanks for testing.

#regzbot fix: 2f7cf3b61d85

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

