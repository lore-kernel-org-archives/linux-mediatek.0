Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1199C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcAax4mGY5XS6LXmltoAYPKWqdfE8AQ1OyYhEly7lVw=; b=2isoPikyFQG3ITt2owvwnmFDjs
	po2hG1DZWKoxcRwqggM23QvUE96/mw1UTVplv0pR998b2pdIGGIzzaPLBi2fxJuYoIxBjSaqZYR2O
	zqBIIm2/Izo8u1ad1jutniJJf/Msl7eE6UAKj9Vm4ZInWx6XlnHhfDEa5WiKEHRD+9KEEf3JtiahL
	F0E45MC21jPW218MsV/RJ/gF/or+HvU0/qI/trD7XhkYjutNFBf84ZfMy0FvmFyHPgu3scVnx1AAY
	nSfwb8DKNfd47yCwlArHXz96xt5mw/3b5M+3ovyEhrDYl4+N/orbd7kLGo7gUWbuC81aDnRDXdH9P
	dJ9wm5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5Dl-00000002cYE-1ISx;
	Fri, 14 Jun 2024 11:35:53 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI5Dh-00000002cX7-3ibI;
	Fri, 14 Jun 2024 11:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718364942; x=1718969742; i=markus.elfring@web.de;
	bh=YcAax4mGY5XS6LXmltoAYPKWqdfE8AQ1OyYhEly7lVw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Kq+LteveHoSa87BACGK2tPOURM+bYwl+3Grz0UndoM3qJ5RioideGdKmfmy4OGrv
	 hzSJUGHAQqpV8BUWuHfrijgOZ+2peQEEGhMsaTotfbqMfPLD+UPj5Lnrl/kk2sRTK
	 MuRTS8PrBuHnh7TYsjoq1Pb0DbQDNkh/2+Pe4Z+5s2oTDiNtfZJgtD4eCPuMXPr63
	 KLwKdu3aeGAk/TzOizo3r+a0Tx2RVWkkmJPzoOixO1CdJzrSw4PTVgGw/qzC614hb
	 6lWczaZ5EhuXPTD3WXg5nXd9quedEquFLKgGcUDu0IMOFpewKPUmSA56lcFr8KYVR
	 nTEhlt8vHyrT/WJcMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbCDq-1spD6s0NsO-00mPh0; Fri, 14
 Jun 2024 13:35:42 +0200
Message-ID: <36c0231a-9916-4734-9042-7a07f4cb85f7@web.de>
Date: Fri, 14 Jun 2024 13:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jason-jh.lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>
References: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eq0ooUkCsx0n+fQtzujpSvtI+YXXA7MuMYC9dd+eoYl1noa3q2u
 8aplDdEWCX2ZAE4jiJZST4bkHw1JoXUswCdqQiz/HQS4ZZauqaHXeXRAysp8ig2f1fVSINJ
 OnZufXWHXdnUGucrm5vziAwqKpCjfnq+vaDcYCdoPY78q+x0EDg8I4exllvjjdUuJphu0wV
 tHdvWKU/Zp2eG8HbNKfzQ==
UI-OutboundReport: notjunk:1;M01:P0:q8ewVWtKAl4=;KGsuYjGac8cOmbgYY6kk9QAUTcG
 A81i94SRhWcE4NPlJ+Ra0TI1oXf8LK1aK3EROqqN3xkxDWRaFnmdHBmkZrDg98XMT0OTPQfmE
 4dgHwShonqR50frrzl9SKUCJQxNqlESDSMkwc3QuPBafYTn1sv2eXr1nd/nrf9lJvT0av4HSS
 FhW8ENUiPdabenuhOQR/crDe36117ZPJcoYn050Ij3+KiWxAModrxC++2iP1s7oP0p+Yr/2nT
 ugoqGbOh4Y5hJW8mlPR3N3qsYr10Uc0eq2RhIwmR3IMf7fgf4Fz8MOp+sEIq0ZqEoUCow6UWO
 yz3Co7hHe2uz8XwHzvbuSVaWbuLV7gpkE0Lw0B1z18hMZBu+OPwbtj5t+VJu3108kxKoqCf3d
 w3mWn3K5TMMyiSKlMfZFP9REOamlJF+eDDll9P/SEkU5zDhM8DPEcUT89eE2x1Bjehc4Pfm3Q
 nWZ10gR1E7wDAG82tgOl3sA7wbliCmkIV/HAtLeOuGK9nNcn3BBJHZrr0lwed+p3c/hSyvBzA
 XNd1yz38vVGwR3+/j/PAm3eEhovgEJwuDLfQTmnJxLvnGLSOzR/Ml5zQLh6ewiPj/SuRciG9g
 Lr9j2u7l/oQR/b3278IiDApzrFKJ5Rh/Rf7jlj7oF/3ppOfh0rUCG1sjVy1UDdx18HXxvS8nc
 JQOB8dZ0OPScW/0tx/yduBzBksvJwvgVOyKypkNScEd+62VWR0jfBewKF+iBcE9fgE7ldxvu+
 qGOrLa3LqRJOdkK4x3XsyFMqVxWN98Ya3QlRcIUK5x5JWtmsEPjG4BZFj17dFg4SoR6z1I4Hz
 HQlEAjLuuKJ8tAXgFm5IG3OW7QEdR61mcdWNI4IKgzIq8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_043550_241210_0A3D3AB9 
X-CRM114-Status: UNSURE (   5.17  )
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

> To avoid pm_runtime APIs calling sleep in all the atomic context APIs

           PM-runtime?


> in mbox_chan_ops, we add power_get/power_put API to let the controllers
> implement them with pm_runtime APIs outside the other atomic context API=
s
> in mbox_chan_ops.

* How do you think about to omit the word =E2=80=9Cwe=E2=80=9D from such a=
 change description?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94

* Would you like to improve any indications for adjustments of data struct=
ures?


> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Does a dot really belong to the personal name
(according to the Developer's Certificate of Origin)?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n438

Regards,
Markus

