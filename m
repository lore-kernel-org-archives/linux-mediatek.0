Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA5BC77B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0VVQ1oOIled6zN1DSz3U6uSBsEMr/SWv+TSpNqCZgk=; b=zCkoRlZPQE6YEy0huEGMKRaY3e
	uiXi5iaRcWv2hhKDihmdVsaUwXabgkKz2oWmKnEaZq7e4k1DhUsh857vy2UZu/+gC6GKCBYGbSuOh
	T6opnuVzwH0aBjGszXn14Z7+HUSkaK+U5mL9qLl6isbaTLmfkwBQIDx0RrSGfP1ynmlc/0bjiPiio
	BLGJHOnHfVl2MkAOdvvQfWItRnTAZYsJ/CWgvrGw7sVWHEvRdLzojueXqUQiUKj5iTxSA7kX4PUc5
	yk5CC4Sc+v0iXzJWcvzR0YGAEqCt0i3PhXXE7NG6+2sSW4tr5v3l0KWt0rSZpY0bfUA2GuYbP8vXT
	ICzIekww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poO9x-00GAg4-1p;
	Mon, 17 Apr 2023 12:40:41 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poO9u-00GAdu-0Y;
	Mon, 17 Apr 2023 12:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681735212; i=markus.elfring@web.de;
	bh=jxgSzj1XPt9cjlz5oKKnRxGu8WXDdOvReKI9ZPhLKGA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=U/FeB7S2B2jKF58m9DDJyeqFi3ueD6voK4QChtE+MSUMKAiFhF/HCQge9mWw7gRmU
	 0HTQCLACh/CmTKqMc2WUmYYz63tAEnswMCkE6HYVx0bY95dYZl4emzZdIhEgB/GN6l
	 1fh3PAow1GoszRkJOSPlDEVXGgpKVK+u5SEmMG4QMW0v/5Ao4iD5uEF5TswROsl4VK
	 Uq/jYbsPd18dCFOVON0FZpBCXkGOjvvEv2KBD5lYUDQzJcsIend0Fv5QarXUSzUIHr
	 G/mQngq7bVN4lIOQFhFdW0nvYdsvzfVjQXqDnY+SDjWI6mLZiJQZx0DCyFPULNhjM9
	 tKhDXFksnoIqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MZSBG-1psFVy216E-00WUDV; Mon, 17
 Apr 2023 14:40:12 +0200
Message-ID: <1d945069-00d3-7d9e-b783-96c368ff114b@web.de>
Date: Mon, 17 Apr 2023 14:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 0/2] media: mediatek: vcodec: Adjustments for
 vdec_vp9_slice_single_decode()
Content-Language: en-GB
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel-janitors@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guo Zhengkui <guozhengkui@vivo.com>, Haowen Bai <baihaowen@meizu.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
 <0341924c-7f0a-28aa-eeae-f7de69ab36d8@xs4all.nl>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0341924c-7f0a-28aa-eeae-f7de69ab36d8@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H125JCFVl/UByHBydIuIg1aOV6MBfsnUl4d+g3QbdovsYO3Cn03
 86q9GVUovq/NqWKre/ZiNbcjSstVhY8NwL6RipSrGfAd9EGMojg1A8vP2yBLXJLedh/bxDv
 LDLBytleb4JexZj+TcpJH6XCxeTofHquafu5h5O+qTsA/Ehtn4AY7sV60llxRb/2dKHoEcu
 +cJNBXleQUrH4DX/zyxvw==
UI-OutboundReport: notjunk:1;M01:P0:E5AoUfoBt90=;Fpq8OEDtf4Vj94aUeerB881ibtf
 /G8LL03f8T1cgxKXBE19EZU+GtrLL/r63P6rVbLADL1byqtUWqVV7cTz2zT2OdMob4Ndgkq6S
 W9v1OnZprcs/uXxgIZoKUpCZySkVruzsjLsBQ6mDsksSEySrWTldmuwsGgSx1b1MxBCRtUNe+
 8SFI8wYpzHePkcShTOHp1qDBXyxBEc+JOiS7NRXhxBRDtDZbs7tZ7oMZvJtbSxrRHyJYkUsX7
 w5Oo5Rypb6FhjTDPtJF4qIlt7kkgzLTWL6LN8JjF1EvOHIMXW8uwQ12novPGtM2Bl7+oh8P/o
 vME7HqZ1zJJ6uyFaLUNpJj+zgv8bhDum04OSZDTroLcRb+m1b0NpyaEJfXVs4/jC9cu1wNhcL
 XYA4BkAAr839x3rp84vIOn+iDEKrCQHXuLT/EzRxKYAWu3GtBIALbDf16uFfqF7K/rq9v1SCq
 q/XKxfjunGCJWjcD44l3gKtNgkDogGIr9SLaQHYQc4zps9iGCXREpnhYvY0uG0WVdktu3UPwy
 Wk6/K2WzstPf8KpIy+OOOIPvEpZoUQgD3tmUHveRNivJYs3cOOQPD+zY7gWKg6pdy3VUP6yVH
 rjwVMVGeto6+Rf8+dBRg1ADm5oVd+gRJn4lGhkw4ldxfQjhwPGCs2rSCWDRIjkAb7K7hCRJ1v
 5Ln7TxErw+I/SM9ukqvTnMcHs9cErWHfQVySHHo6cLTSlOe3BqvvVXjPf+entSLndl13BMd1H
 ugSILXPO8jpjXQnPBqaL8FbuGbmKYIZrDhHnfoufTRriym106AXiZAnrQnlvSjM8/n0q+3AU5
 QsN0/toTNhMbvfz56r34bwIvso+/CKPrclwEZJyIukQDd9RzbolDa6RkF2Hac7jtyA/28nxT3
 XRcH5UFjtA0QfBGfsxQcfLXj+oO6ddMj04vhReBJeD1k81EazjKDNviSO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_054038_656029_34A52D59 
X-CRM114-Status: UNSURE (   6.37  )
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

Date: Mon, 17 Apr 2023 14:32:14 +0200

The deletion of an if statement was requested by Hans Verkuil.
This update triggered another change possibility.

Markus Elfring (2):
  Delete null pointer checks
  Move variable assignments behind null pointer checks

 .../mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

=2D-
2.40.0


