Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D547ECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sF7YhEJi6IxY7+GPcmodKPCdjGaxPJW8WZHlA6K6J0=; b=KJVizKyAXYsuHroiFND/JMKMKQ
	fDgSURF7yb20jVVMGuaT1ibViUtYJscqmVvFlMaNIVDb4pvnUQGGuxy50HkJn27GfGppjoKpIv5rM
	i4TYwomn04IcVOmvUqArQKG+Qv6CoRVFvJo41ew0wkmap45/6D80M2LHddF1iKQBY8OOLWmdSxCMC
	GEbYXE9IhxNazQOpw/TJ2biJTUIHPcLYweUf3xUKap6DrhxqMoil5HOIiNOu2JAOCfM/E3jow+DqM
	D/+QSU2q6rGoR9+jvaw7BQy+UI0UwgguudDUmxqZzozt5GWTMKXmrxN8Iu6LwC79NkaAxZOHIMJT0
	KcUi21Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwr3-00000004wLv-01V0;
	Tue, 10 Sep 2024 09:08:09 +0000
Received: from a7-43.smtp-out.eu-west-1.amazonses.com ([54.240.7.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwqz-00000004wKH-4AIC;
	Tue, 10 Sep 2024 09:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959282;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4MGTJa48J1CqPLOLp7MjUqO5NfFHXXNKzWSU5StJO/c=;
	b=Wpw3QA3BviVlwoK2hCxxDKhj03x5AD417aOlfMpWU1BsuJHGA+/zcrkzSbhp3FAq
	4bBChX1F3l4HN84Qe7EIxuYbZAhUqkdd+BfZuuRAIrEFf9dBSuKQYvxxfJXhenKA8nF
	JYZoGTS+zHFiSfZ/wZdPETfFge+677U/BKCn4ofvbrR2ge00PIiDW4HK/W5OZ6GbAoY
	3HWEX75tyPdAEnLDw2zeu/qwjR6UbN96B3GRObi79IZx4h1c4vrBT9f7vYduPxOzpP4
	OZ7i2bWE9LmBfQ8SGN7OvH3AQfzwKVrAGbKAykUo7Xp/ACKkqOodfomRUFsh4JJjVcR
	sAAFizqC3A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959282;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=4MGTJa48J1CqPLOLp7MjUqO5NfFHXXNKzWSU5StJO/c=;
	b=RqmRS3xhAewkHeNL0yr4Af0zFSCUi/No50VqHgA2DscUeSgybcHdHgiSlLGylsHL
	8FFWq/B+Ggwfjd7MSfaLI8IeoyyYeznEtVHjUCLdeZ7jIMOWbSt75Lr2taF5ZalQ72+
	l3+Q1sycoKTCHm88sII9p71Gnqq0h1EQr+un7tGs=
Message-ID: <01020191db309dcb-22192dd3-993f-45e4-9bf2-1997ba46acb5-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_POLL macro
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-4-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-4-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.43
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_020806_193922_C80765F0 
X-CRM114-Status: UNSURE (   8.00  )
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
> Just like was done with MM_REG_WRITE, remove the mask from the
> MM_REG_POLL macro, leaving MM_REG_POLL_MASK to be used when a mask is
> required, and update the call sites accordingly. In this case, all calls
> require a mask, so MM_REG_POLL remains unused, but at least this makes
> the MM_REG_POLL macros consistent with the MM_REG_WRITE ones.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



