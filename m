Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152D2C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVs4npcT3+c80ySgamRokdTadrA2rAFKHcZhdgvIDrc=; b=VQhQQCi2/xvTmYdO5E1bQw8POJ
	zelWXax5E8gdHUt7ORnJ3ySolP17UmVDWb+Aw2+QORmETNwaL+w557o4AB0YoU2k4BGtQUm+s2lCD
	EAB4oBXT0nbQrN8RKwUOHu4qIXAHVe1JSbiTwWWHQ69kXHGlgWwjuIiqeLsBdFklkkSh/5wBdkwfe
	fSkesZmfuUedzHOcQXHYlUZ3QPDsKy5GjYeBOKQ1lLf5hr4Najpebga9M33y9WHtX6yBZI9QP0shO
	Nh3Z/tX+3bOxA1Vb5TIv+01/R9Qt3ExoUhSfv0mZisGWeTCs+V9l4/zgYLskHe/6RbqvjtZLDyA/K
	7fXIP7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ibU-00000005Yss-2Tzv;
	Tue, 30 Apr 2024 08:12:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ibN-00000005Yr7-3je3;
	Tue, 30 Apr 2024 08:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714464756;
	bh=kMXbAn2OMOLooaNFeMvNIuDBVCdk3qcVfwbqeXByzDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OjAtH466lRmOrMzIXWPkfcVEpGvebFlWG6hO25OPy6YdFb+ZfI3VgGarGOhdoUzjz
	 xfQNiOrVUvY+laLz9usSMjuURRl78S7BWlABpKy5dRs4ytEk52WH4ySnfF6NqBzGu5
	 Q5v4GAOTtNOrnYvyny0vraaZL7mrv8926+PnyiwfhFHYHH8na81XkyyTTOMrh4t5Mq
	 y7LC9RnC+L4F1kf9IF4DjJNzs0zC95PAyTOJ41fw/U0z9D9Mxlgq0Kh2LIo/HXufLb
	 n+lFdMcg/9AE74y4dZS5QkWxSkwElJ0mSVUmjGg0o9fzTOd9Jam+nCnsF4M5LYkiHv
	 NSlKrYxlL52Hg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 153AD378214D;
	Tue, 30 Apr 2024 08:12:36 +0000 (UTC)
Message-ID: <2d208466-369b-48da-93da-30ff5fbff1a8@collabora.com>
Date: Tue, 30 Apr 2024 10:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
 <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
 <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
 <8f777b2f-ab15-4df7-91e5-f779f408fd65@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8f777b2f-ab15-4df7-91e5-f779f408fd65@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_011239_625678_1646A390 
X-CRM114-Status: UNSURE (   9.42  )
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

Il 30/04/24 10:06, Arnd Bergmann ha scritto:
> On Tue, Apr 30, 2024, at 09:55, AngeloGioacchino Del Regno wrote:
>>
>> Yeah, I have to fix my stuff to stop generating the gitolite address when
>> preparing the pull requests.
>>
> 
> This is what I have in my ~/.gitconfig:
> 
> [url "https://git.kernel.org"]
>      insteadOf = git+ssh://gitolite@ra.kernel.org
>      insteadOf = ssh://git@gitolite.ra.kernel.org
>      insteadOf = http://git.kernel.org
> 
> That should be sufficient to transform the URLs the way you need.
> 
>      Arnd

Yeah, it is. Thanks!


