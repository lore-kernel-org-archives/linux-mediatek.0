Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzUbV9MpkOqDFEk33Vuox6Kh/YeHcep30RwUNPzydmw=; b=jbu+CC+C29brTE
	DGXdBnGqXMrmcFt207Ht45eGp4PMOJ2oa/Yd014fm0Wga17VaCphbfJ8TeDft59HklJxbxcWIyeUO
	IdMglkwU9kZhNZNyEeGIYYYqVPXKBvAB337tTzyaEh1QhvNoEKjgo1NYeEfJvjip+Wy3ePKN5DqJu
	5gNGvrYXs3xfkRRUU42x2lUfiZl47oC13C/kVLqSjVKGO3RI/VZU405TR/n31InIlsZtV60Qeri1h
	zj0s4H17Zr11QYFCwvlWsrUIX837BMKAlQV0Q+5TVkzqGGonokUO2Qw/fBiuCW4KrUuuSnxc2COso
	SHzKCqnTcFhuLh6rmmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPGg-001zUk-ME; Tue, 10 May 2022 12:47:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPG6-001zEV-JO; Tue, 10 May 2022 12:46:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6EB751F4198D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652186792;
 bh=+xFxCucJWWtb43xJt9JV4bBlZQLYnNsYtFFdf0v6JvY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EWr7A6fCbxjvxIJmYEHOty2p7MGW8MXul4Z71n2qRmh7shjPIeTr1QiTlAVeSTput
 SCHAkqjlcgTyc5T5FJm26xhwF+Ry1vMfuSVOSPPHlGIbcohBujXjWKPZkfr/pRF2f0
 109zi5LipeG8ydMHHubYVvjqbdQEAO1uwEwHBr5uXcd9+r66zJkFvRXF6bSbMa9BlU
 s/fZfCly2sAs4XqC1+m/6gNLkDsW5uwZVK/a+9mKqHd6jc1iFneI/9fyUuRqPGvv/s
 3PmpoCSf1oVqcvoDbdx5DCsaK3XU4/FOESIPy884NcvG7lxk6kRLb//GEn4dcTnuYX
 1XccN83PA8geQ==
Message-ID: <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
Date: Tue, 10 May 2022 14:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, matthias.bgg@gmail.com, 
 zhiyong.tao@mediatek.com, colin.king@intel.com,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YnpeYGbo7JJK0lDk@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_054634_817438_9AFA9777 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/05/22 14:45, Mark Brown ha scritto:
> On Tue, May 10, 2022 at 02:26:20PM +0200, AngeloGioacchino Del Regno wrote:
>> It was found that some MediaTek SoCs are incompatible with this
>> change. Also, this register was mistakenly understood as it was
>> related to the 16550A register layout selection but, at least
>> on some IPs, if not all, it's related to something else unknown.
>>
>> This reverts commit 6f81fdded0d024c7d4084d434764f30bca1cd6b1.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> Reported-by: "kernelci.org bot" <bot@kernelci.org>


Sorry for missing this tag, and also I'm sorry for the noise.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
