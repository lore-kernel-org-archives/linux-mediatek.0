Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD6EE6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWFEP7tM0wjf6p/5JrHRs4l6Fd8dhOljCSScjquiSzE=; b=hPfUX2apGNunWLhiOFMH2AOajS
	kRbjZGSyfDB3vwqw8Ykm+cSwkamaSSCQxM96s42j0Sci/WPSwdmm/3Hpg2mlQ0bZJE0mmkhkm5v/a
	M2mv0+vEH4gS7PuQRjkhsnXOkKy6cycisbjnfAr8b0VjC9xHMrEZKIVi01lT5AChu0+fGqcBI23iN
	ekOuIfAs4NTBo7kwTPRxR3r4NQzxcirqgdA6c4bwduzlbX5YnRobkk7anO542ZS7K2E/ZtF0n1Iy/
	ysvLJZAuYhKdWmXWbI1jhNm8kK8MStQLBU51RqadbGlk9Fh3IVSNRtHNs2mExx7rcEIY4kGULzsjF
	qJycQQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snJ1l-0000000GxqE-0jq7;
	Sun, 08 Sep 2024 14:36:33 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snJ1h-0000000Gxpi-0juW;
	Sun, 08 Sep 2024 14:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1725806170; x=1726410970; i=markus.elfring@web.de;
	bh=XWFEP7tM0wjf6p/5JrHRs4l6Fd8dhOljCSScjquiSzE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n+wVjpVcHBNz7B6SZPb1L5lTm3hkZKvp9dKeL4rENyJPQUyMwX4xM9eEZZm6zwgF
	 ydiLlhhlGh3PFCPat3al4NHM1J6exLZnLJ9r+UyQt+YU5Rohpl9U23VqMwH3WqCAG
	 pKjP5tsD8NSpwVr2exo71bVcWsNJ4Nd3jRryxbw0N93Nf7lOxonnoJmzuSaGZz6a6
	 jtym8vGTTMlv1jExiXbFwCEvFWe7I+XZLjjq+bzClXJQEARP5mrA8fLIAA5n6BAqF
	 xsw/HPEK+zzigFfG2X2/ir1Sz/6+64dyRezJiYfzbw8z5NZLwCPxLBvL3+tYu9wNS
	 tvQloEhuNHYNhX7uQQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MiMAO-1s8zvA36u6-00degp; Sun, 08
 Sep 2024 16:36:10 +0200
Message-ID: <066bcaba-8f3c-4afc-82ab-2c81ca4ceb95@web.de>
Date: Sun, 8 Sep 2024 16:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tang Bin <tangbin@cmss.chinamobile.com>, linux-sound@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240908134604.3652-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: codecs: fix the right check and simplify code
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240908134604.3652-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a7FM6yZ9QUWzf/F+7OQlgqI+RPBwRznUxoEiTyvs9GStjPkkDS3
 pJ30zCb83RU0kFHMns9th5b/rrR4+SaGttAqqSpAJuZiMOsg1mBN50c7GhMv4ulwBw1dK4g
 zEkWNQaav15zfxV2Hbcs5cH7T5Av7zFlMVsjP97sOjuHMKS5J7HwHudNnjw1BVaPHbAmcVj
 DZ74lMaLKmHyFpzH40mew==
UI-OutboundReport: notjunk:1;M01:P0:n267RWK3I4k=;KlNEiHzhtpd99sO6EPmTY1/PasZ
 dJL3Y4CB1rWrf+B12jmN5CmbjlUlVDCBctU5tbHr7TBH8RssepNjtm+aNIlmwRpk+KM1DkkQc
 Oyg7n4YTqIysk0xII3pZdczaeZqescknVROyIhmzzNxwX40rraNXTPhBMe9u5/1Br1GYhXXN8
 QVDJ+nONa8xE0QuOxcOdkuCu95Ew3ufK2Fc64vo9XkptQcmE7jQqMz9gi2mCJXCDlLR2WT94K
 JPTvCE58YiWpgg+MAEA03sqCSqUhy5Cl+aOUK3h+oSRVJiNsAM8HAP5YcFqj9LGjZ6g+xy+0C
 BL9sVMydA4dc9SumiogAu1HpNHQEAj7EDI8q1vqTwL21kuuHq+jae1o0Fm6mzXCqjSXrBYRb5
 /3N2390+C+5GM5RIP7UwnOr2noK8ffi5oUvhuF0vvvuon2569IF2k+4V2aLPC26WdPl3Gb9n8
 G7mPCmovI5m1OXvafba2Xuq9Fl4WXJuMb+eEGu2OeCVaYm/Pgp8rqRemGsuJn8XqxDwjjxUcb
 L00S6ZPLygOetYn2g8Mqi6GU4OmgLBdf1m3FKmj7Xt9qCAaQr0hUHoMlAbQmhIJ9BMFp+sP3a
 KBdMXOkVCVwQuYjv9b6A0cFx8wZHIJ2X4L6Re5C50TfkwOYMocfLmBP6iKBqs1aHL+6YaFnT0
 KwFsXXyOqEgcUo4LoAMmyd0RRIXKsbtnDaMGyoP3peo9YVKhWlWH9o0HtdgwJ+d/qzYy9T3oo
 /7QAf1e3QGBhRaSiOmYoAIxuv4R89JB9tcmOMYHQ+aXNvuMgEAHDPhgSWi/X4zBG3dV/+sJZs
 ztLk8u5BxGUIJx64vJ8kVdZg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_073629_612754_FE6D1EF3 
X-CRM114-Status: UNSURE (   7.65  )
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

> In the file drivers/base/platform.c, the return description of
> platform_get_irq is 'non-zero IRQ number on success, negative
> error number on failure.', so the check is wrong, fix it. And
> when get irq failed, the function platform_get_irq logs an error
> message.

1. You may occasionally put more than 64 characters into text lines
   of such a change description.

2. How do you think about to split any changes into separate update steps?
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.11-rc6#n81

3. I find the wording =E2=80=9Cfix the right check=E2=80=9D confusing.


Regards,
Markus

