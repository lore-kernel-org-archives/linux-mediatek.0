Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE38C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCqymYkbEYVgdz3Pr3y6W9l3IZZ7mDRNml3neI8dBFA=; b=L2fwnrRP2HvC4YOYPPynTsQ0d3
	M39mhCp8yx+GnzFeIuaCG1TVN10lkwa0w7MZgqwtbRUiitABEDIjmB7ExYxq6lTrXspNtoklM+xtL
	FhR48UXDb9SJFRQQJwNBeiDBsSZ/fi5PPzFVuOy5znyd1LfUpbD69FBD/trbU42amz5HlOsv2YkfB
	4gfh101vPk6UOIrFKYiSzIYtDNwQVwL+tTjgiYDBbsxlPHvUfFsfrHS0ysE/aFg0HW04MZbXVApg4
	W6hOgeasqPXz6oxfk9w5JZvIpoAwr0xKGn2+Hp6jytsLoeLU9pQEeR53CL/x8UZEMVjO8YfyVPjtI
	04QqpZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngUn6-000Dse-Cg; Mon, 18 Apr 2022 17:03:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngUms-000Doz-SB; Mon, 18 Apr 2022 17:03:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05557B8100B;
 Mon, 18 Apr 2022 17:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E903C385A1;
 Mon, 18 Apr 2022 17:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650301419;
 bh=U7b5emuWv09ZHp3g/xBr6t//9YFTZLkxOh4AdPkuKa0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=deqY0bi/cluPMypxFHiKN8ZlG713Q9/6PZnTXTUQ1dHf7AD5rKmK1v8KBKQrJQ5R1
 +ry6xNz/PXoXhLfwfeZEAnfVMWbEGnEu57bqNrkYotYeMksrHzyoGzc4ZoZDpXZ9AA
 L+o+lw2uAwquadm/v2yJcboWavyRqdnX7Sm482vQvhkjD674IM/6+pkaEfZQVjCRHr
 MbzuEppW6UZdzktzvzgO8fJebJ7FA2q6xRabzksxAguVe4wvpd+HuVDdPyvAE2D3yP
 Cl7wjMnbViGtle6y4J4oAS42F6ieWGp1oQDniTQcIVAMYZHq6H9qZW3UeiMzbswceQ
 79u8bce8o+32g==
Content-Type: multipart/mixed; boundary="------------PhJOuQmjjr1lJ1AjV2bKI1kZ"
Message-ID: <ff8a2ede-1489-0412-2425-3191f9fd9026@kernel.org>
Date: Mon, 18 Apr 2022 19:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v18 02/10] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
 <20220412103114.19922-3-jason-jh.lin@mediatek.com>
 <69dd1710a7f1c1715e079ece159fc527c7fecb4c.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <69dd1710a7f1c1715e079ece159fc527c7fecb4c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_100343_249636_DF750159 
X-CRM114-Status: GOOD (  16.09  )
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

This is a multi-part message in MIME format.
--------------PhJOuQmjjr1lJ1AjV2bKI1kZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2022 05:11, Jason-JH Lin wrote:
> Hello Rob, Krzysztof,
> 
> I found the dt-binding patches in this series never appeared in
> devicetree-bindings patchwork and trigger the dt-binding check bot.
> 
> Do you know the reason for this?
> Could you help me with this and let me know what should I do to solve
> this problem?

Hi,

All your emails end up regularly in my Gmail spam folder, similarly to
emails from some other Mediatek people (e.g. Rex-BC Chen), so maybe
that's the cause?

Why they end up in spam? I don't know, but it would be nice if you could
work on this with your IT department. I know that corporate environments
are tricky to change, but there is not much else to do. Google flags
your emails always as spam.

You can see in the headers two DMARC failures:
dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE)
header.from=mediatek.com

Spamming 27 recipients is maybe another reason...

Best regards,
Krzysztof
--------------PhJOuQmjjr1lJ1AjV2bKI1kZ
Content-Type: text/plain; charset=UTF-8; name="mediatek-spam.txt"
Content-Disposition: attachment; filename="mediatek-spam.txt"
Content-Transfer-Encoding: base64

c210cC5tYWlsZnJvbT0iU1JTMD1TaWlCPVVXPW1lZGlhdGVrLmNvbT1qYXNvbi1qaC5saW5A
a2VybmVsLm9yZyI7CiAgICAgICBkbWFyYz1mYWlsIChwPVFVQVJBTlRJTkUgc3A9UVVBUkFO
VElORSBkaXM9UVVBUkFOVElORSkgaGVhZGVyLmZyb209bWVkaWF0ZWsuY29tClJldHVybi1Q
YXRoOiA8U1JTMD1TaWlCPVVXPW1lZGlhdGVrLmNvbT1qYXNvbi1qaC5saW5Aa2VybmVsLm9y
Zz4KUmVjZWl2ZWQ6IGZyb20gYW1zLnNvdXJjZS5rZXJuZWwub3JnIChhbXMuc291cmNlLmtl
cm5lbC5vcmcuIFsyNjA0OjEzODA6NDYwMTplMDA6OjFdKQogICAgICAgIGJ5IG14Lmdvb2ds
ZS5jb20gd2l0aCBFU01UUFMgaWQgbTItMjAwMjBhMTcwOTA2NzljMjAwYjAwNmU4ODExNDll
ODNzaTU1MTQ5NTZlam8uNjI5LjIwMjIuMDQuMTIuMDMuMzEuMzAKICAgICAgICBmb3IgPGsu
a296bG93c2tpLmsra2VybmVsQGdtYWlsLmNvbT4KICAgICAgICAodmVyc2lvbj1UTFMxXzIg
Y2lwaGVyPUVDREhFLUVDRFNBLUFFUzEyOC1HQ00tU0hBMjU2IGJpdHM9MTI4LzEyOCk7CiAg
ICAgICAgVHVlLCAxMiBBcHIgMjAyMiAwMzozMTozMCAtMDcwMCAoUERUKQpSZWNlaXZlZC1T
UEY6IHBhc3MgKGdvb2dsZS5jb206IGRvbWFpbiBvZiBzcnMwPXNpaWI9dXc9bWVkaWF0ZWsu
Y29tPWphc29uLWpoLmxpbkBrZXJuZWwub3JnIGRlc2lnbmF0ZXMgMjYwNDoxMzgwOjQ2MDE6
ZTAwOjoxIGFzIHBlcm1pdHRlZCBzZW5kZXIpIGNsaWVudC1pcD0yNjA0OjEzODA6NDYwMTpl
MDA6OjE7CkF1dGhlbnRpY2F0aW9uLVJlc3VsdHM6IG14Lmdvb2dsZS5jb207CiAgICAgICBz
cGY9cGFzcyAoZ29vZ2xlLmNvbTogZG9tYWluIG9mIHNyczA9c2lpYj11dz1tZWRpYXRlay5j
b209amFzb24tamgubGluQGtlcm5lbC5vcmcgZGVzaWduYXRlcyAyNjA0OjEzODA6NDYwMTpl
MDA6OjEgYXMgcGVybWl0dGVkIHNlbmRlcikgc210cC5tYWlsZnJvbT0iU1JTMD1TaWlCPVVX
PW1lZGlhdGVrLmNvbT1qYXNvbi1qaC5saW5Aa2VybmVsLm9yZyI7CiAgICAgICBkbWFyYz1m
YWlsIChwPVFVQVJBTlRJTkUgc3A9UVVBUkFOVElORSBkaXM9UVVBUkFOVElORSkgaGVhZGVy
LmZyb209bWVkaWF0ZWsuY29tClJlY2VpdmVkOiBmcm9tIHNtdHAua2VybmVsLm9yZyAocmVs
YXkua2VybmVsLm9yZyBbNTIuMjUuMTM5LjE0MF0pICh1c2luZyBUTFN2MS4yIHdpdGggY2lw
aGVyIEVDREhFLVJTQS1BRVMyNTYtR0NNLVNIQTM4NCAoMjU2LzI1NiBiaXRzKSkgKE5vIGNs
aWVudCBjZXJ0aWZpY2F0ZSByZXF1ZXN0ZWQpIGJ5IGFtcy5zb3VyY2Uua2VybmVsLm9yZyAo
UG9zdGZpeCkgd2l0aCBFU01UUFMgaWQgQzYzRDlCODFDQTEgZm9yIDxrLmtvemxvd3NraS5r
K2tlcm5lbEBnbWFpbC5jb20+OyBUdWUsIDEyIEFwciAyMDIyIDEwOjMxOjI5ICswMDAwIChV
VEMpClJlY2VpdmVkOiBieSBzbXRwLmtlcm5lbC5vcmcgKFBvc3RmaXgpIGlkIDhDQTlBQzM4
NUE2OyBUdWUsIDEyIEFwciAyMDIyIDEwOjMxOjI5ICswMDAwIChVVEMpCg==

--------------PhJOuQmjjr1lJ1AjV2bKI1kZ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--------------PhJOuQmjjr1lJ1AjV2bKI1kZ--

