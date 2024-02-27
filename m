Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE8C54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPhWauWFG9Eq5yPAsXD3zB/CxlDkLHGeIaX5cUViM3k=; b=sU41D5r9z1SWfOPBNmq9jAr1ma
	Nri1m5YuBYLjDN4vXD59Ve27i8HJlmKQqhsZzV963tt/6wEax93RVatBwzKL9UDyJY0xlXztRlUo2
	A9FIhpK5c5Pwd34TlbxgOOHLfG4Zki/R3WqUAMWWBDNRp3UW8wB97MoSDlmDBy2mc6IJDAJjrfGGI
	/XABE/7EVCkMGPwzGe8qYqRLqqP5mTfDyIkR6JFeUpdVUU6hd+AHkBtSZk5OI4FErpa59bfrq0d9K
	7mTmzRDfbVvFP7m02vSL2ldfqMfXHLLxzao5F6zNb8BdfERC/mMh/nX1wRvuE+Ffpn9FRwV++1cZF
	5QC3g2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex4W-00000005I2K-13gV;
	Tue, 27 Feb 2024 13:00:36 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex4L-00000005HxP-1wDQ;
	Tue, 27 Feb 2024 13:00:27 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id E922820017E;
	Tue, 27 Feb 2024 08:00:21 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 08:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709038821; x=1709046021; bh=qPhWauWFG9
	Eq5yPAsXD3zB/CxlDkLHGeIaX5cUViM3k=; b=doMEcxipmJOZYakN3E69jPQTdJ
	35sJW+eMxDEU8wKW5gL+aFVD9Lr2+/edhVCxEueBE4SjPQOOss9i9kkMWRN8dYRs
	0cHV1uSXJYAAVbYRiGTlv5y2d1eXgfQkS91+dtyGHqyfZajToxSHp5gJGx4NU/cw
	9Pjc1gWLfwK3f32OZwnzMAv5Y4kiAxJvPqbJvqJ5St9yq9p8Od3wmm+ZnmOXrZ2n
	/Dfr6WSnp4B0ELzxOcQBhJnu7CO1t0Bmf/SZIojeTgenD+MPZl3P3xlv1Ajwu5qC
	HucusYS22u1ijyfs8TDmYhuB/7drh5dT8Sf2P6Gc3IbZx259GkWereX/KiYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709038821; x=1709046021; bh=qPhWauWFG9Eq5yPAsXD3zB/CxlDk
	LHGeIaX5cUViM3k=; b=iJjpvobV8lNMXdJ3c9X5ZoAAm/tB04RwJ+tFspixbk+l
	hz3A64T3SgGeYuk55UvKXWvbIKHLgmy0TG3nY3NQz+m6bxzoKx/2HPz9ihZrkCno
	jADwgmVs0EptdeWMszSZvRVT4CySjCnvCVU2Siw4tNNrNWCGvGlOnNdI5B8VCa22
	otMigDXjT17c5/6vcf6B+tuoh+MaMCpLqriInSba2m0fOuHXAzr5a7Qz2mPTA2V4
	EDlo+WH2ug6p4Yx9jIAo6bHwYGKKVYDt54ZNLyUkqeyMkGP1KCzP1HK/L7NaPJES
	QCcr4Lc1WL2dYkWeNgepRALAxeizpyhylJ/nShJOtg==
X-ME-Sender: <xms:5NzdZZGAK9VhWesFRNNqNkG96wMflx-scjSiaMqTXVDS0j51JzogHQ>
    <xme:5NzdZeUfqmTtfxQafXKrGTwTvt8V7k5ITBoIQIPmeawTFgAFAztj4QHDvouWN5p__
    VB6rgcxw95y3Gke9qY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeeiteejheekhfdttefhieffjefgvdelhfelueffueffveehfeelleelffeuvedt
    teenucffohhmrghinheplhhinhhugihtvhdrohhrghdpkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvg
X-ME-Proxy: <xmx:5NzdZbKqk6nDm5QR8YNCcucQCZU_V6L7yapRoyhF3aavtDGeVCBaJg>
    <xmx:5NzdZfEFN9zLKP1x3Bx_sC-jOfni3oqSjeCUGUDiapdNwL9sL4b7Hg>
    <xmx:5NzdZfXRM-fbGooB_ZPCBUQpYnWgH9phi_pNy8oHELaSWMS_O0Fiig>
    <xmx:5dzdZc1qsknl85aTY6dDAmAkBxVQUtq9_xxQMiHx6UwxsCloMWfgT5zYEJ8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 84657B6008D; Tue, 27 Feb 2024 08:00:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <8e3e7d82-a9e7-4697-8147-d3800f0307db@app.fastmail.com>
In-Reply-To: <CANiDSCsMVR7gqzwrhPCWb7dQcezWbcHxkPNLZJrW=TWaAn+kXA@mail.gmail.com>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
 <20240226-fix-clang-warnings-v2-3-fa1bc931d17e@chromium.org>
 <c25638af-d40d-4dbc-a179-efb6f29c38aa@xs4all.nl>
 <CANiDSCsMVR7gqzwrhPCWb7dQcezWbcHxkPNLZJrW=TWaAn+kXA@mail.gmail.com>
Date: Tue, 27 Feb 2024 13:59:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ricardo Ribalda" <ribalda@chromium.org>,
 "Hans Verkuil" <hverkuil@xs4all.nl>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Mike Isely at pobox" <isely@pobox.com>,
 "Tiffany Lin" <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>,
 "Yunfei Dong" <yunfei.dong@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Sebastian Fricke" <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_050025_626028_F44D07B6 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, Feb 27, 2024, at 12:35, Ricardo Ribalda wrote:
> On Tue, 27 Feb 2024 at 12:17, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Ricardo,
>>
>> First of all, note the typo in theo subject line: vcodedc -> vcodec.
>>
>> There is also a similar (but not identical!) patch from Arnd:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/20240224121059.1806691-1-arnd@kernel.org/
>>
>> That patch and yours share the change to common/mtk_vcodec_fw_vpu.c but otherwise
>> they are different, which is a bit odd.
>>
>> Can you take a look at Arnd's patch and see if you need to incorporate his changes
>> into your patch?
>
> We went separate paths :), I tried to make everything const (and
> therefore the remoteproc changes) and he removed the const.

I had the same patch 3 originally but there was still a
warning or a cast from const to non-const pointer, so I
went with the simpler approach that I posted. 

Without that regression, your patch would be nicer, but I
think the version you sent has the same regression that
I ran into.

> His patch looks good to me. Shall I resend the series without this
> patch or you can ignore 3/3 and take 1 and 2?

I also sent your patches 1 and 2 with minor differences in
whitespace. Both of these are already in linux-next, so I think
you don't have to resend anything here.

I sent a whole lot of -Wcast-function-type-strict warning fixes
to address all randconfig builds on arm64, arm and x86, all but
three are now merged. Aside from the mediatek vcodec, the only
missing ones are

https://lore.kernel.org/all/20240213095631.454543-1-arnd@kernel.org/
https://lore.kernel.org/all/20240213100238.456912-1-arnd@kernel.org/

I also had one patch for s390 but none of the other architectures.
I think once Hans applies the vcodec patch, I'll resend the
last two patches together with a patch to enable the warning by
default.

     Arnd

