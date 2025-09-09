Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3EFCAC589
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghFyZUGdZ7mO0wqQ4/RAL3CXKOgBO+Pq9aSKHM71k80=; b=mA6PBpUxh4G3DT0VNEPQt+CIds
	4ZJ60i0n9bfLVf/iT6ui3g1z6Qju5rPw6dYPw3msPGBVH4Qq9bj39nOTU5d3y5mKZ/rrXVA9tcPYO
	I+FqmiOfP4+OO/2vmEqjkK7b+y/nZJeL7d0UOP4yo+dKDwnQtz7fEevcpDl0ASyxKuqR0rRPVCKO/
	VCveYfC+X5DvORRkJT+WiI8wlIlAEa41znS70XO7HDZfGvBJb+bvIOgmNAvAbIwFvD30gQLWW8Gdl
	o59VrlrAyPbyRczwyPnVNS23sGMGixYPMc0hINxTmTqKluLdxeQN9vUfx0eenclg+GfpGo3OuVwRM
	nzzDM5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsJ4-00000004yUC-1JH6;
	Tue, 09 Sep 2025 06:58:22 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqY4-00000004Lql-2dI4
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 05:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ghFyZUGdZ7mO0wqQ4/RAL3CXKOgBO+Pq9aSKHM71k80=; b=hdhFDgmKyMhYNyU7ekjmjMl7c8
	wmH6MibDUk8mCcbYvnIZCp4rG+clm186+LS8QwEd3pg5R4L6y99rb+oqLAXgbT6kB505Cb3dk/fzV
	VXIHfODhkQfqIBCkJvHZkuWQeyhp8vUXrGN9LcWkcCHh5peKQGvfyDDBon2l/3UagMJ4=;
Received: from p5b206816.dip0.t-ipconnect.de ([91.32.104.22] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1uvqXu-004Dp8-0Z;
	Tue, 09 Sep 2025 07:05:34 +0200
Message-ID: <71c03b80-6ea8-4393-9210-c50a6ac73323@nbd.name>
Date: Tue, 9 Sep 2025 07:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: mt76: connac: synchronize token_count access in
 mt76_connac_skip_fw_pmctrl
To: =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?=
 <Mingyen.Hsieh@mediatek.com>, "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 =?UTF-8?B?RXJpYy1TWSBDaGFuZyAo5by15pu45rqQKQ==?=
 <Eric-SY.Chang@mediatek.com>, =?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
 <Deren.Wu@mediatek.com>, Ryder Lee <Ryder.Lee@mediatek.com>,
 =?UTF-8?B?UXVhbiBaaG91ICjlkajlhagp?= <Quan.Zhou@mediatek.com>,
 =?UTF-8?B?TWljaGFlbCBMbyAo576F55Kn56ugKQ==?= <Michael.Lo@mediatek.com>,
 =?UTF-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
 Sean Wang <Sean.Wang@mediatek.com>, =?UTF-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?=
 <Leon.Yen@mediatek.com>, =?UTF-8?B?S00gTGluICjmnpfmmIbmsJEp?=
 <km.lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
 <20250904030649.655436-5-mingyen.hsieh@mediatek.com>
 <bafba000-2488-4382-ae0c-df6195b83019@nbd.name>
 <61ad7900d5909359d8c1907b6c80db921c0da612.camel@mediatek.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
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
In-Reply-To: <61ad7900d5909359d8c1907b6c80db921c0da612.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_220544_743223_9F1B9F5E 
X-CRM114-Status: UNSURE (   6.67  )
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

On 05.09.25 04:14, Mingyen Hsieh (謝明諺) wrote:
> I haven't seen a real race so far, but during my observation, I noticed
> that some functions using token_count are protected by a lock. That's
> why i added the protection in this patch. These are just my thoughts,
> and maybe i might have missed something-perhaps the protection isn't
> needed here.

In that case, I don't think that this patch adds any extra race 
protection. Other places that take dev->token_lock typically either 
write a token related variable or interact with the idr as well and need 
locking because of that.

Thanks,

- Felix

