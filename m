Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B44CE8E7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAbwWCJIhjmDL10SOWhFgEPvuvKrrEovgnZDi+9VAfA=; b=mlXk7PnDej4tLwyMn3FnnGKUkN
	b5q76dGp0ou5ZteHpOC50xJKMD7Ht0sQBnBDcSElXmG0bKZwUJTvs2Fg+ITjqdBhdrkF3ljcXI18L
	qDM62lxEaTSUyKy8VG/NVlq5h0mogVtnYXhmJJY0+4EHGuEL84iADHcivR/LaRnsSSKKeXsUtEQNm
	z1X4JYHkT3tBsaMPbOlvZYNiy8ddJo49mT8LCpWEx3tcU7gF72xV9FThfwFRQJSNl84os7TCqUm5P
	6acz2zcb7irbi4SYqLN9fX7ZK4RdpWnquWmBi9KKIBl2LaxpmBVRkPSlf5aVp3VMiI17hnvIMhH2V
	Kl/Vsvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ycD-00000000fbW-2RwW;
	Thu, 24 Oct 2024 14:15:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yc9-00000000fZA-2gjZ
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 14:15:03 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539ee1acb86so1111973e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729779299; x=1730384099; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bAbwWCJIhjmDL10SOWhFgEPvuvKrrEovgnZDi+9VAfA=;
        b=YgvQJ8o7NGfKQPqk3kg3BLwHcKTZ71NL6Ky9/aU22i3L4cSUkQL6+oM9qbOgEArS25
         BynIcLnk6iCt5jChbpkYqyDYBAqCcIZaGrOaS+Ge3JY3uo4d7MfI5LlaGuL9fjkh1lfS
         dmMxwgk+dwAhSpyRKOisgeaRB/TeuDGw5uxORV8xTdud1/Kyr3yQ40689m+LbFVL0XL3
         aoCOTXHumPcMYgxHrGU04Kc4Ks04/1vdffZHVgCH5zmaBmkSFF0lN8yKRWH+dTVmR+cQ
         Qidu7pw/BnTUfsdr39ilDEl1gyNZoRNlmcbtVJNkEmpnPv1GdQtxmJ284K5UVCUHtCyN
         2u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779299; x=1730384099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAbwWCJIhjmDL10SOWhFgEPvuvKrrEovgnZDi+9VAfA=;
        b=jZL+LulKs6kRTWxgimQd/b84pD+FWF9UwQyBUWQRMgO0WLJEuMcY9Ka8G0hrkeFy6B
         ET1UGuNbvkDuCkY4v0jUYFrIZGN1tJ/mF3V9w7eMDOYRBvW3UiEAz4Hdp5MBGzaAfq+W
         uGjqzZ9JqORpHNtJO1eZ69q52TvmG/0ZcA3NX5qyEC9dXEQ6vkySP4i5TkMfnzad2yzZ
         qwGfHujw0royC0es+Dykm8EC9jmDXyXkk5mu4Dl12C6iFLGk8z6TpMiWJR8c66NLCW5c
         X4SvE5YMJB+85ncZzs6q0LsO14gKGwS6FOoL+qAsz4kwyGfFutgBysg+087Fa9Gv6s5j
         k0ug==
X-Forwarded-Encrypted: i=1; AJvYcCU7mFtfJ6DYsARtdHTLirKYCBf7PzzopRpPhoo4c28igvOQvH0LMQiVFlGsWL5m5SvxPwpDRVR5xv4sg7pKWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY7J3XgsOE30xBWCw1va2dJsZfT/OsaeceYfXapB8nfaydFv1e
	S9YRXltDYljfI8mx2yO7KbCPL6S3P8FKP5Ztkyh3nHs826SFGvaMZH881/MWdTl5jvEwHUOFZpF
	x
X-Google-Smtp-Source: AGHT+IGDRne6FjUO8+JY3OAL+VZkSOAWuwWaVVfwT9eHEotWjUKxfy136t7bAVw+D1VRNrMm0Hvi2w==
X-Received: by 2002:a05:6512:3d0c:b0:537:a824:7e5 with SMTP id 2adb3069b0e04-53b1a30203amr3254616e87.18.1729779299297;
        Thu, 24 Oct 2024 07:14:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224312fesm1367096e87.187.2024.10.24.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:14:58 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:14:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: 20220315151852 created <yr.yang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	shawnku@google.com
Subject: Re: [PATCH] mediatek: Add sof-tolg for mt8195
Message-ID: <qrrvxy6r2k6v36hmxbjsteiivqfjkjie3mfatakyp6mxoextnr@ubzg5osgkupa>
References: <20241024034558.667-1-yr.yang@mediatek.com>
 <20241024034558.667-2-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024034558.667-2-yr.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_071501_723854_6C6F9031 
X-CRM114-Status: GOOD (  14.38  )
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

On Thu, Oct 24, 2024 at 11:44:07AM +0800, 20220315151852 created wrote:
> Add sof-mt8195-mt6359-max98390-rt5682.tplg
> 
> Signed-off-by: 20220315151852 created <yr.yang@mediatek.com>

This doesn't look like a name or identity of any kind. Could you please
fix your Git setup?

> ---
>  .../sof-mt8195-mt6359-max98390-rt5682.tplg      | Bin 0 -> 16191 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> 
> diff --git a/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg b/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> new file mode 100644
> index 0000000000000000000000000000000000000000..427d6c62387b53f8ac898a86b506e8c0cb4362a7
> GIT binary patch
> literal 16191
> zcmeHO&1(}u6pz+w(N^lmNqX2rz=IIFNk73u)1-xBYy&knp+qefth6*Oq_-X_2p+7W
> zAby-g@aSC+A_#udqem}7|BL$jxwCPS?(WQ{N!qRR;O(32zS(*6oB8Esb~BlU>2!O{
> zkq(%+D3^pi1iL88-LUjIB2=7isA<F9+InIcDJ+KPhV=y384^QShn|4uGnegwJPI0;
> zFP2Knb4v>=H|MPUd~x+!@%k;x9`LNW4e`7nPG(^(QD#h!ap>%Raj$&)etP5OudVjY
> zI~N!?V`aBCaQ!gs13E(<3Cn&E+R?(eo#^G2#)_&RJ!p=~I2qp!=o(_1g)KrEUl%kz
> zKGvI<DqKNPDe#?{o*JLY=8{TZReV2j2TR<AkP+weU2i_T+s>z7or_;x{rLNm9RD-n
> z`&`&KEc@n;0Z(%b*jIN9E~3nPQ=dW+KaP4L*L{c^l<a|dVy7d-_7pTfksr%VOpYb&
> zgc4?@gVeAJThfN{6Q85dPtYv@^%<7()iJSe!hVM(MnA;ov#_kob6=o$&%^?`OU&ud
> ze!JWq+!c2Rai^W4>US1ZEK!ZIH-Njzea>AwJa<z9A%CO7xgPFvJR-^6B)J<5v(iC=
> zT7_+^xy$cQm%E)PGw%*%q<{m8a^B4p7nfI-W-WWjyMn6U^>CLh)qdymJE$9qyqnrD
> z++~uI^X^H+hdGl>OiZGr7Wn?nyM<hz(piObJ>2E@JGn~^$Dy1roHu^IedOG^r+GI;
> z?gqoGbU;5{QDN)F-OXdo%ex#0>N?cr?(lB7JM8wf+N%1Ug}WuH=;mFz2XMD<pK~`A
> zp1b`5A%CO7xgPG4r;+4tAGsS0v(iC=T7_-1xr?uX%6fN%2>?RwZeW0P*Ho+{eEpWU
> zbg2mQAeEdnVi0H)0&}>L{M%3U%!TvZm9@9A7?r;%T;&{nPlpj6I9vB_#{T1@dY!~*
> z9X_Tk+k44Mmx}P20Cn$rR|&-w4iEzVeDt1_QRJh}+J{3*KEl^`9V!p|X?&nk3@05N
> z%rQC$)bd{S45kshck^Q*r(VwxNr#X9mhH2)l+ngx<`|V?_~_tZj?qEDmybSkzY%<t
> z->Du4RB-{<T8~p;8)d!(f?&O@{r=9WVU7lY)*w)BO*5tygMdMx2?*5wUVDu;n1Yyp
> z_?%}1If&1F(y;t2zatvOxiJ5)kn4thza;;+!TnFk&ittN><8U2Vi0Hv0wzDU1ZLBS
> zL7*uJL^VG$?%MpQ`z*F8K$@Ex1UwKh`OyOubIKqP5d@-|AGwy@nIHAujYMQ<Oqd4%
> z0h1pOz#y6~{I>{1H9zwI$MQQ$J`Z-^QFfqH>=$!rv-U}b*++`^quP5R5wf;~>01z1
> z#7SV)lznN$N_XELunOK3rHxLtBe2r$TM$;9cf=~pex~Y3f<J}XUlhhSxYg>b7=z%=
> mEs}c>R_;3*Vx_x(M7p)Ii2iHu=LqAgY*=ytR>7MIB;P-JU)df2
> 
> literal 0
> HcmV?d00001
> 
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry

