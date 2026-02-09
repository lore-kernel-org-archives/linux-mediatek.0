Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA91E7E0CA
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 11:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GYCFNOAgBtRtNhUXt4Q9SrqFgrDt42zGg7jLgOv318=; b=1RJxwQFPB4Y0evSpfjMdgvd89L
	FF0+b2g0o/gU06Lioz9bDwyJd38iKN+s3SFWzGKAVMAbDWfaQqW6CsNNdBbBlQux0Q1atoO42+EYx
	3CbRw2VS0DhpYAHgBPwQDJpX2iKz5UGqh1NZsOxdA22hyZvejIv9crE9Mog12iINivxeyzfk7Hcxp
	wRs3mISVWDZfQn5mPFRT6sohNJ3958GzlwHvfu+6LGMmB62RZZQ9rR/+AtjmLb0xAIEHweaCmxaCC
	H0nnwo6ZmLz6V6/eGd3xuL6jcvF/WKTWUiBwTglJX6T2Z80xiR2udrJbOKyC0aIjuKC5BsAu2OPNU
	YOwQ+u2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpP6N-0000000FGzy-1pcU;
	Mon, 09 Feb 2026 11:06:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpP6K-0000000FGzC-3NfW
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 11:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770635200;
	bh=2lMWX6iA/+dulHjSwMbZnkcOOKboG3fTdavqfRIbpws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C2zivwwyQTDIsfTUyyxZA1GPOYma4KFEMoAmYarbFKpRhvs6jxqp/Of4oWiEevBxj
	 Dn4hzO7dmMjjHxbl1D8YsyJPam0wjrpXgxpingTsz0SbJxbVuCcPumhDovPht6i0uj
	 +nUSYMyx0HiCWHVObk4RN2OjmsxowAjktMThAhfULy2yIlWulNUA4NjMYwySzFin6M
	 2aQ1KWxC4miqKJGq14V3bv21xsJ13qWKAJZoqkGMWxF+c+hbkNXTKPqHohlQrSswvs
	 PQUWe8NMIL6O/uZRewUrBHwhAX7Dzm3N5gwCc0cJiwYTE+obdtIslbXB18PM//sMnL
	 r9HGFIYWnM4YA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 225AE17E1144;
	Mon,  9 Feb 2026 12:06:40 +0100 (CET)
Message-ID: <56dcaa86-d4a6-4ba5-9dd4-adf8c057cb2c@collabora.com>
Date: Mon, 9 Feb 2026 12:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Denis Gessert <denisgessert@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_030645_002797_2B62D464 
X-CRM114-Status: GOOD (  11.26  )
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

Il 06/02/26 12:33, Denis Gessert ha scritto:
> Hi,
> 
> I found this email chain while troubleshooting why my Levovo Duet
> (with the MT8183 chip) would not boot using any 6.18.* kernel.
> 
> I can confirm that on my device the current stable 6.18.8 does not
> boot unless I revert the commit
> 
> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Date:   Thu Jul 24 10:39:08 2025 +0200
> 
>      arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
> 
> mentioned below. With the reverted commit the device boots as intended.
> 
> PS: Apologies for the potential double-mail. My first message bounced
> because it was HTML, so I am sending it again text-only. (This is my
> first time on the mailing list..)
> 
> Cheers,
> 
> Denis

Hello Denis,

This patch should be resolving the issue -> 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/mediatek?h=next-20260205&id=be0b304eeb8c5f77e4f98f64e58729d879195f2f


Cheers,
Angelo

