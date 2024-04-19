Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80CAC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCCJwcOwDMi+uBG9Ep9SmW6RW/D4XxJnpJ0is2Omqgo=; b=FU6ycs4VqvKe8WvkaLZZcsnLBw
	qA3/DC+D+3EAplvJjFT8S+vrQUkd9ozGJ+EnybzxS0FUK1uYZBEPNgR9V2ETJbuZ26r2WR22X9XJZ
	PeRmrIxrC4DAOAGv0wmD8+vOK2+dw0BVjlnM3X+YNSPGr/BO3+Ki0XYuQYuTqlCTdWrfNZWo+T68e
	e0MXzCQiKyb6KcuZBZ7jpOzW/yzQrYl367XLrbanK/A+HWePjBs1Q9E0xTb6+giPoJeVLWgUQ+3JQ
	7ys7Bl3UDztLnPEzm+lA53sTiR5L545mrsENwIU0CFpSSTBeQWJ54zTcSfUp8d1KT7Cpxd/rn6qaj
	wvxi8z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxitv-00000004onQ-1RIS;
	Fri, 19 Apr 2024 07:43:15 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxitq-00000004omI-42DB
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 07:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eCCJwcOwDMi+uBG9Ep9SmW6RW/D4XxJnpJ0is2Omqgo=; b=ajSLl262vVfiCF8CRRdVfUCilL
	laoqDYgN0/hMr5WMqsI4HRsP6mFErp+LSfuV9pAQiASv9SZ36DwF01+FgkjWnngHc0TDIGFb5Pc+D
	Em9t+I60lN/xxhj/4meWfxWuDq+rowwstzY1LP/jp7rNAFCwP4c0O74WDzo6LQ/oH/p8=;
Received: from [2a01:599:123:e10b:9920:bcd0:407c:1305] (helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1rxitZ-003Xeg-1N;
	Fri, 19 Apr 2024 09:42:53 +0200
Message-ID: <f0fde96d-f105-45a0-a0da-97e7d38d54bb@nbd.name>
Date: Fri, 19 Apr 2024 09:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7925: ensure 4-byte alignment for suspend &
 wow command
To: Sean Wang <sean.wang@kernel.org>,
 Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: lorenzo@kernel.org, deren.wu@mediatek.com, Sean.Wang@mediatek.com,
 Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
 Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240307110815.527-1-mingyen.hsieh@mediatek.com>
 <CAGp9LzqHS5Mdge1V37NGY3MFLwxA8YhRSymB+ijw-5u=Uk-66g@mail.gmail.com>
From: Felix Fietkau <nbd@nbd.name>
Content-Language: en-US
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <CAGp9LzqHS5Mdge1V37NGY3MFLwxA8YhRSymB+ijw-5u=Uk-66g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_004311_218155_08B82C03 
X-CRM114-Status: UNSURE (   8.33  )
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

On 18.04.24 00:21, Sean Wang wrote:
> Hi nbd,
> 
> I'm aware that the patch has been merged into the mt76 tree though.
> Could you assist in updating the commit message for the patch in the
> mt76 tree by including the appropriate "Fixes" tag and CC to the
> stable tree? like Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add
> Mediatek Wi-Fi7 driver for mt7925 chips")  Otherwise, the mt7925
> cannot operate correctly.
>        Sean

Sure, no problem. It's updated in my tree now.

- Felix


