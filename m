Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D9CECE582
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpJ4KSSrt26i0Fqga+ydUWpFf7U5KGGE0wBsM+FhQKk=; b=4s3XDpdPNQZu9cUe9WgKqw9Sm+
	K2G8PT0c3t/c2miL5xJlDKg5wjZ2059q+MJEEMmZlNfcCzTxVmH8PfF6govurSLqEalJiK2UdAbu2
	ulerbhs+x5y9mdlq6mt93tpQkselzXun7gO0wrPcyt4TJH34Rn10CAZ5qTZIKv30bezegb8VJkwPf
	oyypeKBA7LTl+dQH2u/BiK7mS8vATPvNj3w86hzcrPP9CIE9kk8ll00tPzWMEClcp4o/TcKESPYSi
	ofwjHxEKvrEiN8ivfzdi7NdGZPZMtwhtpEPFON2b3gk9Nr/aq4NmZf8vtvAKitbA/t2STlZGLVByz
	DSNpyUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwt6-00000004wx4-14s1;
	Tue, 10 Sep 2024 09:10:16 +0000
Received: from a7-41.smtp-out.eu-west-1.amazonses.com ([54.240.7.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwr3-00000004wKt-1bf8;
	Tue, 10 Sep 2024 09:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959285;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=YGyux75frUROiKBR8BVeRnZtNkiumWKzL/r5Z0b2hbk=;
	b=bbxiucwabcZyCrhB80nPa4ERQYA6FgwGyvd0fLQ3V7/2zbkLYDPifjLib5oN5lLR
	yn6i6WntdBgB9Wywrrplvzr3kvir8NYJtj+aUMlnjRWYN8/n9brbo89D2Mp/tG2ODRN
	ZDasfjKcMQzCatg8BAoleQEzWFNal1Zj18CascZzMhDqRQa//KISy7z5CjQN/7oqTMO
	zQHd1H6vMwGNryZWexG5G6cQh9zK0UDDhYzC0pno0a3gTiU16b2jw8g/lUYEK1QcsWM
	TVXDekupfQvPVn+5K0mGuwIGQGplwErXKzFKBGiTdYFqcMk7aXtIETW53+AYfn1cNFg
	EcdlzaMbIA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959285;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=YGyux75frUROiKBR8BVeRnZtNkiumWKzL/r5Z0b2hbk=;
	b=VkR/KWY+y/b3osPFjQ2o2gopU9IojQUgApPoREvkFxYqVhICTsY2mwkvvjWJk8cB
	nty2HcJBOaVLI+9wQuUkGwSJZ5kfx2eFFhFiJjYD3MoBKlzZ76R31o/FshMxhfXJO1S
	ODViL/FRWBZ54yZvXDmT8kxV+X383W2FtHoyfPuQ=
Message-ID: <01020191db30ab48-f8d1ad5b-7468-4675-a11d-46b1df659e32-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_WRITE macro
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-3-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-3-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_020809_614569_406B63AA 
X-CRM114-Status: GOOD (  10.02  )
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
> There are two macros to issue a cmdq write: MM_REG_WRITE_MASK and
> MM_REG_WRITE, but confusingly, both of them take a mask parameter. The
> difference is that MM_REG_WRITE additionally checks whether the mask
> passed in contains the register mask, in which case, the 0xffffffff mask
> is passed to cmdq_pkt_write_mask(), effectively disregarding the mask
> and calling cmdq_pkt_write() as an optimization.
> 
> Move that optimization to the MM_REG_WRITE_MASK macro and make
> MM_REG_WRITE the variant that doesn't take a mask, directly calling to
> cmdq_pkt_write().
> 
> Change the call sites to MM_REG_WRITE whenever a mask wasn't necessary
> (ie 0xffffffff or a <register>_MASK was passed as mask) and in other
> cases to MM_REG_WRITE_MASK.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



