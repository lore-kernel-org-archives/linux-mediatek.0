Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885F7CE7AE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/qbsQnhoRVWnIKxqDbsfPTTFW5h8DVW8RmtvDaWG/c=; b=dGceR4uio0v0vv5A0WVNHzOc8t
	JyzMi2Btw6aAGaWoMziEQfjzujVNBge9IRP+SDq2W5HUqfDNi183fu6pa64K73i0hoPFtQUSKTH0L
	3xtH3R3T2HSDU0EKSNRl9yIB71hdJVKL3lsIPUXlMB9XsP/6OD+0jPuXChL76Iy1VknJXTMlNrdIh
	4QZDjahDg9bNJKoAn4Bwyq9ex815TR+RALz489G2VcoV87s4pMsLpyrHEj8d9W90o6JFvOkF7tOjX
	lW4BY2RQ1Wom4mLvI6VBls8zIdYMCjk2NYMXcC8nfBjcdMf62WjY7pW2psTGr/c/ZaeW6kc+KjybX
	jCZ9bgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUHM-0000000BIof-0nlv;
	Fri, 06 Sep 2024 08:25:16 +0000
Received: from a7-50.smtp-out.eu-west-1.amazonses.com ([54.240.7.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU8D-0000000BGGD-2ZIf;
	Fri, 06 Sep 2024 08:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610546;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
	b=kUFFKTHHBd/JqEo+8xtUNUiXSTdiKf1TVC21fUrLGXz912Wp7bTIpwt3o4aMlXN7
	eI3CaYLsoOg0sn7ECQkYLryyqyiJ0F9BcBkYN9pY+h6XjciEqvZyH0rZOQT0Pa9xNFS
	rQZr1+to56I7wILAZJVVJX6XoMuWG7BGi+PHigEaEiRgrDL2+8fy/vKhnILqcqVL+2w
	GtYhzrQx/PBCEeo1FD0egxIPrwO0HzCGidQ7wZX9cCtrpj8BO/30HOdwWCnD/f7hTye
	DPktdonfuIBZMxKbFA4FVradAcr4E5HntroxWs4MyQMW9U5idKwodeFciA6NgU6+lkQ
	BnQcE/7qBQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610546;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
	b=H4SOWUe8qRqlOzVrsykccb12OFxX8XUYslSv0/QIq/FiNVwLK30PLKhfdFgt3dvK
	+urQXrGjVP06HCGzU6GfFJdzx9fq00WBGMXlDBw3SkeDpjwfp4ZIeYy/CHU8P8rTSw4
	UtVp/4Ay+RHL0tncUd+2RL8kzP4rR+8EVhf59Vjk=
Message-ID: <01020191c667530a-66e8f4db-1b0e-46d3-a69b-3362e84e0f02-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:15:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: platform: mtk-mdp3: Get fine-grain control
 of cmdq_pkt_finalize()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, 
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-2-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-2-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_011550_361837_70BDBDFC 
X-CRM114-Status: UNSURE (   4.44  )
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

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



