Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA97DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01PtQo+byQTlxsh0U0i7gGl8Cr+oId62iPS1DQj8ow0=; b=KLuyzCm9XN2kDN
	H61ewRCS4q1SnErpOBX34qkgzTN0r1JQp8lgYuqJHQ7BJ1/xOP6s8KIOOqWqNO5KvRnoa+GyQFO6k
	YzmWjtxkne8xPsd5+ISEHakHDW2j5Gvw19Oe3TjtYEAn1RuhaIAqOGjWUZr7sbVyoSZ3rTztpY0jz
	Ma+2cVe8P++EJYX7UVlotuUcUohmrqEmp/VgRu5hLGJiTL6AlPI73rowMetGZ28f0rrHISJ8MYgJY
	Ol1n0fnBgXNYQieyRqi6LOUdmbk5CfTbjrdXTCvmPhDP9H23Zh5Jq8jT9BjSYek9lq5W8yufID40y
	RzY1BRb+NB4RvnJg8L+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk7vp-0082E5-Aw; Thu, 28 Apr 2022 17:27:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk7vd-0082B1-74; Thu, 28 Apr 2022 17:27:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 17F951F45AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651166861;
 bh=f/YKBB23D0bseW16hv84OHBRhIMmK//gXgwxfifn6wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFHkcLOf+zGzJqMAyknpw1W9Uy7790ipn/B7lvWc+TpS3A8R0HmJfYVV80brlodQn
 LlOc33tIg6LIgDA4KNLWt0/ULYZFRv9Km77eVdUg+GOawujomqVnWdUhZAAHCibRlA
 7jGDAm48/pS9de43lgY4fUZPRR+LDnGTuQ+MrR68A7kVJzpxvBsqKy+IjTrWEg+fUu
 0CuQcLhCztNqOJWQx6qKfxZK8lgsi4XAisTSyyOeU4Vty4gYNho8caBV0GduangYLT
 +dGb05RLZHX3thrDUl4SiQ13KCyRKsG0DxqYRiBhbiwxIHRnlmVtXs3pOaTeJOT8aK
 iJgw52vNTgPqA==
Date: Thu, 28 Apr 2022 13:27:36 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 hsinyi@chromium.org
Subject: Re: [PATCH v8 2/2] arm64: dts: Add MediaTek SoC MT8186 dts and
 evaluation board and Makefile
Message-ID: <20220428172736.qlkinujpxjxumsnx@notapiano>
References: <20220428061717.11197-1-allen-kh.cheng@mediatek.com>
 <20220428061717.11197-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428061717.11197-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_102745_506587_44A99304 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

On Thu, Apr 28, 2022 at 02:17:17PM +0800, Allen-KH Cheng wrote:
> +		scp: scp@10500000 {
> +			compatible =3D "mediatek,mt8186-scp";
> +			reg =3D <0 0x10500000 0 0x40000>,
> +			      <0 0x105c0000 0 0x19080>;
> +			reg-names =3D "sram", "cfg";

The mtk,scp dt-binding should be updated as it currently doesn't allow l1tc=
m to
be missing. According to comments in the driver cfg is optional as well, so=
 a
patch to the binding making both optional would be great.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
