Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA2ECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rl85W4BlG5cLml6zT5zB65pFYFOEeE+qqsmGdDeulk=; b=aqcFwpVsBerN0Y4L3fa6WXGz0Y
	mcvM+nDT0DPd1Rvd8b9TvGu4RjcvLJlwzexN6ZJrocuvKFgztZYBiZNgoqdsiiyM4NMMDJYh4/sp0
	bvWjHq1PB+29mA5xjkvzCgIp0eCoikMHaSzVsY0SsvFTEq2hleuwjNcWgkns8uPQ6YJUi8OshqLxs
	8iSJBGveYe16k6dZN+IIsmVJvs/Wd/Tdo8oTySbjqhpuf1nlc1IQofFzqtudc/PQqiSuHxZu2hZdl
	isIOb/yZ0g7iKX3QM0isViPBKfckO/ssCb03gIraLU/xXjevwsRjt0qCMGHngNqFJUtdmFpALN8pj
	lQOi+nag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snws5-00000004wgt-1HhT;
	Tue, 10 Sep 2024 09:09:13 +0000
Received: from a7-48.smtp-out.eu-west-1.amazonses.com ([54.240.7.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwr1-00000004wKZ-3cGi;
	Tue, 10 Sep 2024 09:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959284;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WH9kVZysmZNMRDwXp4grwWcs4nQAIudKkDgd3CUuEZs=;
	b=fqNqOr4nXf4A+hn8ibVShcL4kwFD89Y1P93+Us30+DrWl0VPalhBdr/SGM6HQFjW
	TMsDpXtkdK29OLc4HOXn48kUbij8ouzdftnUnkBFRKphyENpe+Ow++pyrmUCr/I3xEY
	4DBbS3gT4FO7UNngblAqy0kFyF4keV2YaYIckCchK9kTR+jk8DtQN+2BDfufkjWc/wd
	HM3v9gAt6jIZm/0l4Vjy1GEa9Byku2gSYA2etudFkgvSt9tYH7TmpvijM0uvWkiX//5
	YTvrfBJosdYcVtCIUIdlZbnd7oBkeidhOBRy1o81ccxqj/wEfi8bxNtWidkIsVcNfPl
	BeWL4tfZww==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959284;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=WH9kVZysmZNMRDwXp4grwWcs4nQAIudKkDgd3CUuEZs=;
	b=ekRH7SVVIJ5L/mxPW7f+vC/XT2x1XxTJRETS7BC7Yj/8U2Fkh7miZ9fF37CVm4y8
	VIsSwagX4ejafJg9f4W5zYGIEZoYIhFtDSzGniIY3SdNfZVC1hzJkW3QToVljG4GKrP
	yOfs+V/to9USTVDK8eh94jeP+avUU7T4L+25CbwY=
Message-ID: <01020191db30a663-da080c6b-23b4-4a2b-9e3b-b32c2f1318df-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: platform: mtk-mdp3: Remove useless variadic
 arguments from macros
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-2-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-2-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.48
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_020808_060880_8DE53B78 
X-CRM114-Status: UNSURE (   5.06  )
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

Il 23/08/24 23:31, Nícolas F. R. A. Prado ha scritto:
> A few macros declare variadic arguments even though the underlying
> functions don't support them. Remove them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

