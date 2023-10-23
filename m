Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCBCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHX9uY0n1jxgv5A7K/dCOBwnI4isugh0B1x9wed8QHc=; b=obVQLqfekgyapw
	aCxflMajt3pDekgUXH9fFOadH9umChBkl1koUSoLbCSeYe3BQ7P6l5XHqe33GKoD8Kw80pkZ9ic5h
	fta+73MtYOdZQUZrF0RerMgf7YBM3vnL8sX41faGHjAVAAu+7mv4bEzPvR35Wn0eOx2wl7pBHkBZi
	dPRmoHN2uWUFnPtbwM0U8BM5fkNCf7/XLwhkVgOSPxBjcdZfV9bQar3RJzLpotN/gLuLcL+SpoEQd
	lpD4wV4lWqQg6nP/Vuq/dbRucQtM8AIPmZ5BMzYwt4VHKxkxOnXmXNaSF0Xx8AhawuBbkUDjZ9Irv
	RIH7doQ4BxiB/1sxB6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quv6Q-007SM8-0K;
	Mon, 23 Oct 2023 13:36:18 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quv6N-007SKr-0N;
	Mon, 23 Oct 2023 13:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1698068168; x=1698672968; i=frank-w@public-files.de;
	bh=bHX9uY0n1jxgv5A7K/dCOBwnI4isugh0B1x9wed8QHc=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=Tf9klKPGfMXfI06FbAggnF8skruvRXW04BOyiFURlpxqBoaug8zLNPyy03bQF8XN
	 bWWdUDOUoot1ceSCImZCJiwuZG0cIdSlLAkf9vfvTMlxV1XC2/EG94HEFgrXCJnPz
	 2deYIXQ4jQiyqXjVwTuodNofcC/JRCR+ETDXbfC/7pmCcxcMvqTiy5KFBE9qlBY2W
	 rDrQfETwQdEjEUBmZ6N0Amq24yLPvc4mqxHz/iTnRuJBGKlHxrRwndFOQrLlgrrr4
	 zmMSxdS93D1YQ79Rfiuws3scPRvI36IPv5GHCbtdAU6PsTIaYiUYrC6TJqyq4PAlT
	 I8JFS4NSpA8lpuMkhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.159.145]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1rGjCe3k8Z-00nPd7; Mon, 23
 Oct 2023 15:36:08 +0200
Date: Mon, 23 Oct 2023 15:36:08 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_=5BRFC_v1=5D_arm64=3A_dts=3A_mediatek=3A_a?= =?US-ASCII?Q?dd_dtbs_with_applied_overlays_for_bpi-r3?=
User-Agent: K-9 Mail for Android
In-Reply-To: <9c1a1119-3257-44dc-8223-7992ea6c86ac@linaro.org>
References: <20230916083214.7059-1-linux@fw-web.de> <trinity-3fe161a2-70f1-4619-be28-199ea6201668-1696078629921@3c-app-gmx-bs36> <trinity-13c822b5-7d6f-4bd0-863f-8f98b1a8689b-1698062394687@3c-app-gmx-bs46> <9c1a1119-3257-44dc-8223-7992ea6c86ac@linaro.org>
Message-ID: <29DCF69F-41B5-4BFB-9539-7ADCC52104ED@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SEgFZ4eJTbDGHg/lzCFATStNZMzwiLIDyp/MPCJx+qd9kBVNELE
 ghwfE2yKSYCQ0qTv/o+MXTQcMnzHBAV+EA2WlLziMvIuGbwskr56KFqrRgxKGJpEgHHi19S
 kjd76WgWZrWWcvWC7ASEcnPoQ9hYvosROqj63TDMiALsHqG7k7s+SHm4kV4TWycB16aoXz+
 xzxVkUhVu4KxvioqAihaA==
UI-OutboundReport: notjunk:1;M01:P0:bvf2UyTccBk=;cWEI/gCcaDj4zOvlh7yQXZOckMy
 7tCGqAmK8KaSg7HRspzTzAQ+Qc/awhkrYzQ8VXofBf2JcdyRy24B99Z6yBI9FGza0LxAG/Uj3
 bHKQyQBN435dn1P3i7IgCjxavUnoIcv/sLAxLW7cF2NFPGejnJT5XqTFvYjorfiFTVbWhTdgq
 IKnk4d15i0IjZCA5PyRqGnSDSCrfUTcCdVn8sLUDMDAaT69JmsIM/mIzh65UVWW30b6TR+bBN
 SCB+4QQbCdfCPqlJFKzxHH57sIG7amOUWOQHzZMex0S3NQc8NwZGcETMYR9NroX4iJO3LbS0N
 oP5+o2aQHIPzxKoipuwHcHS2s+UK+HJdBqd1C/eogjjJhxBeS10nEtq8Nc3xu7Kh21zNahDSW
 ehLOzvnYdPIbueydkIJPxfBE/UAk/b8ZT8jTWydfTD+aernsMbWkbY2hq0nR4mH/QQ42SaH4p
 jH56dxMCrd8g6/VA8pd6xph3SoLu0ZKZlgoWjMoWq0bqM4V+NuyGRA9KU+PDbrmKYkA+Lcr6t
 dBY6O1ufXq2oTPlWsjB2pWCu5Skq8++9Tqb63ZzeWxfYFRXrE0Id2L1FHD+zbOCqwwPXChkO4
 Ip9WdaXZWCnuDnmHS+2lbmjVgruN2/ewr7O5T9+tYfnIeWy8b8YsziVF+gdxwcsNj98L5CaTh
 gcz75ThRK9lxkMN8wc3LhmR5qpb+9+aRmy20t42oiBhJSvoage3IZYBdF81GYlRb09l/fSViR
 4+Q4QTcgf+WIRES9IL2xIaONxrAPv928FtRIBKwF0cPSCaJO+beDAeDvqzMf4k2GhyrQMhhI+
 r1wxBGlIpt5OWAtK1bxom6gn8bgGOYW+0KRY+tvcWJAUgONJy4Us8GUbpSkcV1JEegdU7O8fL
 PIcmcyt56Qumpmtm+QoMNpY4hzjpy4ZWEppvTMqZYuZKu6mtmcWXjM0stFW8vGwEPanHjNYc7
 Ygrtnw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_063615_443421_F8AB66A9 
X-CRM114-Status: UNSURE (   7.85  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 23=2E Oktober 2023 15:25:27 MESZ schrieb Krzysztof Kozlowski <krzysztof=
=2Ekozlowski@linaro=2Eorg>:
>On 23/10/2023 13:59, Frank Wunderlich wrote:
>> Hi Rob/Krzysztof
>>=20
>> can you please give an Ack or tell me if something is wrong?
>
>Hm? I do not recall being the maintainer of Mediatek=2E Why do you need a=
n
>Ack from me?
>
>Best regards,
>Krzysztof
>

I asked you because rob suggested the fix,but does not confirm i have done=
 it right=2E I guess you have same role,or am i wrong here (sorry then)?

If no ack is needed, then mtk maintainer can apply it to solve the problem=
 rob reports? So then we can continue with additional dts changes
regards Frank

