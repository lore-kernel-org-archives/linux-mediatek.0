Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8073CCED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ul2VVXH4yAFhla5kOpMVwA5HpYndlSc1uJyqi0FG6jw=; b=Q3v+/nBypxBC7sDrHrDmonypIj
	xr84rPmrcZpBYMMFyDxvvdADkzRJFxnPUWnOiyxabIJt6QQ70GfuF10d18+GAGasXFzLwmCRYJz1l
	B3IjXvn/YDtKNODQS+KhhjdOPbORbuAnHjDZiBE2kemnNxFwKkRJ6LjHxkDWWULh8nqkBfiMxoQ4q
	uupeZwOy4G7BDEDUOM5VPggCj6nvpQxjpaa089Fl2bphGOoakR4ztL7CrEU8XQ95B2rZZ4TJ8QIjb
	7JiLLORvSZVy+ieMc2wlcDtV6FD/TgwjXp/kMLKxXVbY/hmVvUCvwe5HsLW7JcOcEn6KS4pjRWYeE
	v7xLHudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Zz-000000052JO-1CMe;
	Tue, 08 Oct 2024 08:28:27 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Or-00000004ywA-2Gqn;
	Tue, 08 Oct 2024 08:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728375404; x=1728980204; i=markus.elfring@web.de;
	bh=Ul2VVXH4yAFhla5kOpMVwA5HpYndlSc1uJyqi0FG6jw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=evWyjHu3sRHqqrrfhTyWoCdKQKxT2u6NaFaSfDoAD3B4lA6ff6y8pvadPGREaj4K
	 SmQxcZYhx3t9UbbjgTgr8X2OE2xVwjZel6Vqz/WmFVYz32JHUYx+ZZwIFm4VILGjK
	 T8VyTj/28r+YHqYgDb3JW9mSZo+lRbQYmaLdCCr6BD6tp+/6JdMKc4HezKCAoMPk+
	 hmXRjdaRdMTeWY/t1ZOS1/9V+OERfSEo5F6l4yMuIcfSDIZmuTzaxf1W1SA0s8b/5
	 UNB4pCA03FRUMij4A3csWrk6HItK5RsFAZzuLAcwKrJ7eb4asudRg9cMzv4zkXjgB
	 mJHM7k2OgTPD+TH6QA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQud-1tVoSl3M0x-00TDhn; Tue, 08
 Oct 2024 10:16:44 +0200
Message-ID: <0116377a-cbf1-45d7-b961-4ef0198ad8d7@web.de>
Date: Tue, 8 Oct 2024 10:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>
References: <20241008064716.14670-5-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v10 4/5] drm/mediatek: ovl: Add blend_modes to driver data
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241008064716.14670-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/45JQZTFUrLmsnNO2lMHMmIKfcQ7FjKtxaiHnVyKHAn/AuAQ6wy
 2jmpg/rs12xHsFV1VZTGY5bIwvUuOqWMVXijl3MuThJxYYU/lp0prh2ip3mp2YA0bZiMIuq
 6Cp6RuDPHD0eWnrOSsfe0DveSBOqvi6IvCV+PRuJMNOLHM+/lEB0rNIufc3hRrn+Jhl+mx0
 GrrjNKiRGBDLdktY5afdA==
UI-OutboundReport: notjunk:1;M01:P0:ZrxzjTqyd20=;hzAgJwDX9T/8GAXHZfhFc6x5vtE
 /J1DXUfcnGS87XYr+JAirPZ/yNXoozNLi/+Kf676sAhuYaQkO7HAUCPx9DLfQyMaCV9EO4AbV
 s2hu8PMYWj7/3iVd1hKRj6fyAFMiWb/PGKCoHG2bpXLMW0MLCUGeiUH+PDcwZOk8DZdubYNFc
 lUBON6DppWgPp5wQpjaCvy28SepRR0OKKVM+Hg2rONTf6c8N+kBaVi4+ZW+hq7XnMo1z8kcXd
 841cA5OGPfKAoA00fNdLSR0rf76cUPGMgoNr91lQVIdokx1piMIW34NlJ8eTT05Uouf/p2uwi
 zqY948fVpXEOyC0c4w5g4AXVtzbzaFbesGwOwe5uYbBWl6cdoCPryKvWZEC4Ede1BM9Kzie08
 0h1aubk+Q4myc4m8V0hRZD8Xe1xGp2i2hwOLIZTIzHG5MBK0Ku2AnxfHz9tii5F5Uaxa1QhK8
 U7IZFWGY/VLZaWIdwTKZrsrRqcC2caINtAYh8uXgxTbRL4H9EhVUPtpKUc8uTqL6sQK8wVWJ3
 UrZYs5R+J27v4wDlslYFXnQynSMpyZcXiKyFUULmf/AEta8nKhxUbgDO7m7p3MU5sPFuF7PVB
 XsYfaC8NbGnhHpXqDTpKX2fzGx+aBsIt6U5AKyEIEE3RlWP2SjT6DJY7G5cA+j3oXj2gkxS4C
 +hOMXvNJNWNpjG4P6dz6Gv/iryD7aWjeP8Pm2046WhSyuA/F7ITSs0rIvjZlko+d8YaqFLzi6
 lsI7Qc/nTgcoughuuEr6LQkic5MYGv0ez6SgW3MZnQCLIjubsu15v8vn5F9C654C/PvY0snL/
 hTNJMNNMliFC7paciNy58x9A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_011657_927594_6B6C6929 
X-CRM114-Status: UNSURE (   3.39  )
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

=E2=80=A6
> pre-multiplied is supported in the current platform.
=E2=80=A6

                format would be?


Regards,
Markus

