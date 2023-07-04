Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28666EB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyGAJb/q3tqQcZ2W+JulaaKT2SHdQuqBKQ0EoXB4AmA=; b=PqWAZvic3xgNcp
	klxGHxoS/VNqxtXes7DOkeZtMf1dmz8kYBWJ3OOWGvdiO63ltAaANAfEwpFKkJ1RW03fea5r4ge9S
	Zmrj/B2XPNA/iliUCD6GkRYsTccNKqpFqvAm5ApnoDQByIQeIDJZp2QDYTZLuJXy56eSK+K9YDGci
	4dgr+5MrcauDl0wmRBY+SMCJzI+X8u6UhuH4a9f1By2p9sDVDY7CYOhy+eZ4U96/EQ9BN2HoOdiKb
	FRiA/K5hWPoEO9nIb0mZG0xKdghf/Q18Yavppyh7w9Vx76kJ8jYJ9lmXWliE464gRhV9thllGznem
	zoTBnouz7zXJ7YIrBV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetF-00DCn6-0N;
	Tue, 04 Jul 2023 12:12:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetB-00DCkd-2x
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 12:12:15 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230704121150euoutp01992f28d283d04454d5c26bef77ca2066~uqPvyuex80124501245euoutp01S
	for <linux-mediatek@lists.infradead.org>; Tue,  4 Jul 2023 12:11:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230704121150euoutp01992f28d283d04454d5c26bef77ca2066~uqPvyuex80124501245euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1688472710;
	bh=YyGAJb/q3tqQcZ2W+JulaaKT2SHdQuqBKQ0EoXB4AmA=;
	h=Date:Subject:To:CC:From:In-Reply-To:References:From;
	b=PtcpdhsXECSpduj+sDH/Y0PDgMNF3m5YTxy720Ydpvo+A/7iFVHyPJOzqwK2kGUgv
	 rVZy9Qmt7OyQEIe3O0DAPLM6WV4BP6rD991HmHYFc+LJshR3nGxV6w9znvFPW2e7K3
	 AcjycivlgFyULqtXeRDHCpV8TotYJh7yty2/7hdI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230704121148eucas1p12ce4e9a088be6fb90957fa50a8e0c5b5~uqPuNE0ss1616416164eucas1p1P;
	Tue,  4 Jul 2023 12:11:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 3C.17.11320.48C04A46; Tue,  4
	Jul 2023 13:11:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230704121148eucas1p1a346072c4ff918f9b7c90f1901b8bfb4~uqPtzEgxI2899828998eucas1p1x;
	Tue,  4 Jul 2023 12:11:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230704121148eusmtrp142c1a17af1c6741bcbec18e351c54494~uqPtyXSHi1847518475eusmtrp1L;
	Tue,  4 Jul 2023 12:11:48 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-02-64a40c84cca2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.3A.10549.48C04A46; Tue,  4
	Jul 2023 13:11:48 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230704121148eusmtip1874992cdee4d805e50891d8da75794c5~uqPtmq8SG2020220202eusmtip1k;
	Tue,  4 Jul 2023 12:11:48 +0000 (GMT)
Received: from [192.168.8.209] (106.210.248.231) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 4 Jul 2023 13:11:47 +0100
Message-ID: <aad3e8fb-d16b-3fab-f17b-3e6645c946cd@samsung.com>
Date: Tue, 4 Jul 2023 14:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: [PATCH] scripts/gdb: fix 'lx-lsmod' show the wrong size
Content-Language: en-US
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Luis Chamberlain
	<mcgrof@kernel.org>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>,
	<linux-mm@kvack.org>, <andrew.yang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <20230620094834.14688-1-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [106.210.248.231]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7djP87otPEtSDA7eUbQ4em4Zk8WllRIW
	bzdfZLe4d/Mms8Wp7s1MFo/39rFbbHp8jdXi8q45bBaXmy8yWtxb85/VoqnF2OLGhKeMFqtP
	WTjweuy4u4TRY+esu+wem1Z1snls+jSJ3WPzknqPlpP7WTy2n5zE5PF5k1wARxSXTUpqTmZZ
	apG+XQJXxrXnkxgLpktU/Fs6g62B8ZtAFyMnh4SAicTVH9eYuxi5OIQEVjBKLG+bxAbhfGGU
	+LVsBjuE85lRonHqGaYuRg6wlt3zDSDiyxklJq37g1C0ecJ0FghnF6PEn/cLGEGW8ArYSex8
	vIIVxGYRUJHY/Ho6K0RcUOLkzCcsILaoQLRE67L7bCC2sICLRPPWXewgNrOAuMStJ/OZQIaK
	CMxgknh57TbYtcwCjxgl1u3+wgJyE5uAlkRjJ1gDp4CDxJSO/UwQzZoSrdt/Qw2Sl9j+dg4z
	xAvKEp+eJ0ACoFbi1JZbYPMlBA5zSiyesZANIuEicfv4VVYIW1ji1fEt7BC2jMTpyT0sEHa1
	xNMbv5khmlsYJfp3rmeDWGAt0XcmB6LGUeL55hlQe/kkbrwVhDiHT2LStunMExhVZyEFxSwk
	L89C8sEsJB8sYGRZxSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZjaTv87/mUH4/JXH/UO
	MTJxMB5ilOBgVhLhXfF9cYoQb0piZVVqUX58UWlOavEhRmkOFiVxXm3bk8lCAumJJanZqakF
	qUUwWSYOTqkGJl52Q3EGeRdnw1n7i/d3OCxSMbnjXsLO+8/ury2P+rYOhcwTOzqm1ZZnmnwp
	2rn01OlVJRcm6u3LcN4Ywq0RtkZ5IffxBcHeU1+pCxiHW/vq7wjW6S9g+b/XaKVbbL2N1puC
	n2d/NHua+YaX/w7nYo12N2DPmPN0rcmiWQtblSflb2te9ajT5Zpdgt0PQW2pokqj13w7rr1q
	OivhNJUrYUv49m2XFzGx6CXyi+UEtzSln0jpt8uduVvhzeGT2pzul446dPnzuG9T/CsW0Mf5
	zHW+RW/x8dNvz7r/75vLv+WI8JVzM+p3v0176+pyIT5LoF7h/6KYJ2eKUxK0hRUaX6yf07i1
	Zn2z03yh90uUWIozEg21mIuKEwGnPe8j3AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsVy+t/xu7otPEtSDL6t5rA4em4Zk8WllRIW
	bzdfZLe4d/Mms8Wp7s1MFo/39rFbbHp8jdXi8q45bBaXmy8yWtxb85/VoqnF2OLGhKeMFqtP
	WTjweuy4u4TRY+esu+wem1Z1snls+jSJ3WPzknqPlpP7WTy2n5zE5PF5k1wAR5SeTVF+aUmq
	QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexrXnkxgLpktU/Fs6
	g62B8ZtAFyMHh4SAicTu+QZdjFwcQgJLGSXmvVjF3MXICRSXkdj45SorhC0s8edaFxtE0UdG
	iQcrp7CAJIQEdjFK9L1yBbF5Bewkdj5eAdbAIqAisfn1dFaIuKDEyZlPwOpFBaIlVn++ABYX
	FnCRaN66ix3EZhYQl7j1ZD4TyAIRgRlMEge+tjGDOMwCjxgl1u3+wgKxejKjxKTpzxlB7mYT
	0JJo7ATr5hRwkJjSsZ8JYpKmROv231BT5SW2v53DDPGmssSn5wkQ39RKfP77jHECo+gsJPfN
	QnLHLCSTZiGZtICRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgOth27OfmHYzzXn3UO8TI
	xMF4iFGCg1lJhHfF98UpQrwpiZVVqUX58UWlOanFhxhNgYE0kVlKNDkfmJDySuINzQxMDU3M
	LA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYxCct4Hp5Pqgy8KHfo6WPZp/3Xlcl
	EF/pW+BiouL/PW0a04XMNxdZD30SZ031bfRo8+6RX96bmjExPGrzaZ1r86c18pQ9ruS7Uzsz
	YwL/zDNXxRqajrYLZp2ZoSR68UN/xbOkJ2pLTpTdbYws8xB7asKoGvjFwWAB7xIBTqULU/WD
	OVYt13Rld2+Ri9xzofPVm11/OzNU4jYH7vgYWLXSbtWypJ2zhO2uz1n5s+3qwdtqmovad9+t
	1O9vXX6hVZ7zie3MVbUHEw+GVJ3PeeS59tfh3vJieYV39W2T6i++27ftgsbXKe2XH+cxP1e7
	c2ZfjPgujW9siX5fA2+IvHu4LMnt1Y8JJ5+t6s9hD+zjUWIpzkg01GIuKk4EABPW55uQAwAA
X-CMS-MailID: 20230704121148eucas1p1a346072c4ff918f9b7c90f1901b8bfb4
X-Msg-Generator: CA
X-RootMTR: 20230620094846eucas1p21dfc03b10384449dee5e67837ba3e72d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230620094846eucas1p21dfc03b10384449dee5e67837ba3e72d
References: <CGME20230620094846eucas1p21dfc03b10384449dee5e67837ba3e72d@eucas1p2.samsung.com>
	<20230620094834.14688-1-Kuan-Ying.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051214_216157_6F10C45F 
X-CRM114-Status: GOOD (  19.11  )
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

> 'lsmod' shows total core layout size, so we need to
> sum up all the sections in core layout in gdb scripts.
> 
> / # lsmod
> kasan_test 200704 0 - Live 0xffff80007f640000
> 
> Before patch:
> (gdb) lx-lsmod
> Address            Module                  Size  Used by
> 0xffff80007f640000 kasan_test             36864  0
> 
> After patch:
> (gdb) lx-lsmod
> Address            Module                  Size  Used by
> 0xffff80007f640000 kasan_test            200704  0
> 
> Fixes: b4aff7513df3 ("scripts/gdb: use mem instead of core_layout to get the module address")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---

Just one minor comment, but apart from that, feel free to add:

Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>

> diff --git a/scripts/gdb/linux/modules.py b/scripts/gdb/linux/modules.py
> index 261f28640f4c..84933c4c1083 100644
> --- a/scripts/gdb/linux/modules.py
> +++ b/scripts/gdb/linux/modules.py
> @@ -73,11 +73,17 @@ class LxLsmod(gdb.Command):
>                  "        " if utils.get_long_type().sizeof == 8 else ""))
>  
>          for module in module_list():
> -            layout = module['mem'][constants.LX_MOD_TEXT]
> +            total_size = 0
> +            for i in range(constants.LX_MOD_TEXT, constants.LX_MOD_RO_AFTER_INIT + 1):
> +                layout = module['mem'][i]
> +                if i == constants.LX_MOD_TEXT:
> +                    text_addr = str(layout['base']).split()[0]
> +                total_size += layout['size']
> +
>              gdb.write("{address} {name:<19} {size:>8}  {ref}".format(
> -                address=str(layout['base']).split()[0],
> +                address=text_addr,
>                  name=module['name'].string(),
> -                size=str(layout['size']),
> +                size=str(total_size),
>                  ref=str(module['refcnt']['counter'] - 1)))
>  
>              t = self._module_use_type.get_type().pointer()

We could slightly modify the code to remove the special condition with `i == constants.LX_MOD_TEXT`:

(I made changes on top of your patch)

diff --git a/scripts/gdb/linux/modules.py b/scripts/gdb/linux/modules.py
index 84933c4c1083..f76a43bfa15f 100644
--- a/scripts/gdb/linux/modules.py
+++ b/scripts/gdb/linux/modules.py
@@ -73,12 +73,12 @@ class LxLsmod(gdb.Command):
                 "        " if utils.get_long_type().sizeof == 8 else ""))

         for module in module_list():
+            text = module['mem'][constants.LX_MOD_TEXT]
+            text_addr = str(text['base']).split()[0]
             total_size = 0
+
             for i in range(constants.LX_MOD_TEXT, constants.LX_MOD_RO_AFTER_INIT + 1):
-                layout = module['mem'][i]
-                if i == constants.LX_MOD_TEXT:
-                    text_addr = str(layout['base']).split()[0]
-                total_size += layout['size']
+                total_size += module['mem'][i]['size']

             gdb.write("{address} {name:<19} {size:>8}  {ref}".format(
                 address=text_addr,

