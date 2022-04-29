Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxfVbQnNQp6RGSwzmzgefqxR+eBspqbCEsu6490RH0M=; b=FUXT1yuca29+dN
	uzbav281tCBWVcl2mKH05pLX6hzwPSvGszoQizj/NjizbhmHGb9TXjN4d36Om5u0G17K2DJ7h3LN9
	LHxfUPGLNuPi9Bb+7d3Pj+tb+PZQGF9dd3ukB2wprj+i+Cz5Tp3LGs2Cv00P8Ku2PXE+2urZoeifG
	XLiQr/cA3KFVKamOdKnZzKIOEpfmzPU0P2BaK20arMl+4Dvb8T23GPVLKSvWohnLalUnQaJTinqUn
	/TdKjhNDexJpR9gJQ4Mx50K8MjXyxsSyoyYNhdtooFA3CrWLQ5IINp/ke4TT+0ocDAOvd53/2eJaX
	9VAv/mFYBUh7rEspRzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkYKl-00CoEC-BT; Fri, 29 Apr 2022 21:39:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkYKZ-00Co9W-Gi; Fri, 29 Apr 2022 21:39:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EF97B1F44998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651268354;
 bh=WK4FKxae6LiE0ifOj5eYluz18VJJvRL3D1Oio2jffCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H7tQBYWieqJk/kul1aCTNMBZGLJonywzSUcjW69kxCCY+dOCDNEbVaEDvQWMvZ3x2
 qiDmZJwvKW2XuNOi23eg2IG/UgSXjEoU4H5AFxaqsa6qyQ6vO2lf+QAV6kfcoUsJOt
 S+suDoPEZyHlAZlwt1MRmDJvnnOuL/WpIkzjWukKrGPBM9iMCwJRtTExYhCCEXSCd1
 DNL8BfDCCwqKciTaPJE9oCr1iVpKBjuZ0WJnl8Gvs7Puqsp54Jsq0nyLme66MnEzbw
 QjB6+wUxMBJp4Pf2fO+VNxsvMGzMocMH0pvKKr4/6SCrtyhSm++W5FV5atqfc4/K7W
 vA8Y0VpysqLVA==
Date: Fri, 29 Apr 2022 17:39:07 -0400
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
Message-ID: <20220429213907.d2lwnukugoa7owxn@notapiano>
References: <20220428061717.11197-1-allen-kh.cheng@mediatek.com>
 <20220428061717.11197-3-allen-kh.cheng@mediatek.com>
 <20220428172736.qlkinujpxjxumsnx@notapiano>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428172736.qlkinujpxjxumsnx@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_143915_723953_E1B9E2F4 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, Apr 28, 2022 at 01:27:41PM -0400, N=EDcolas F. R. A. Prado wrote:
> Hi Allen,
> =

> On Thu, Apr 28, 2022 at 02:17:17PM +0800, Allen-KH Cheng wrote:
> > +		scp: scp@10500000 {
> > +			compatible =3D "mediatek,mt8186-scp";
> > +			reg =3D <0 0x10500000 0 0x40000>,
> > +			      <0 0x105c0000 0 0x19080>;
> > +			reg-names =3D "sram", "cfg";
> =

> The mtk,scp dt-binding should be updated as it currently doesn't allow l1=
tcm to
> be missing. According to comments in the driver cfg is optional as well, =
so a
> patch to the binding making both optional would be great.

Hi Allen,

actually I've just sent a patch for this myself [1], as it was also require=
d for
mt8192-asurada. Sorry for the noise.

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/20220429211111.2214119-2-nfraprado@collabor=
a.com/

> =

> Thanks,
> N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
