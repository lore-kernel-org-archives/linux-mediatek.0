Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9BBC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 06:04:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D422073A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 06:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nJO8JrQd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="QzGYEHo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D422073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=id0tHyDF1aEy7ZLT32UUiQDlw2LXFT8f/hjFPunC+AM=; b=nJO8JrQdQLGWlvfPEnJJUcZgrS
	Y0O08mxq8C9UxggX+5NTyG0vWte7u8zZWumts+Gk2DutJDF6Ocx8ZG6RY5C8b7lunrRGr6WeMQtwm
	9NTufa797fKyjh7GYrv7GAgVuAe2YKWwalEXVhPISdd9YDGUUgKlAFQdUQ3UfJ5MpPiO1govVYhFp
	kIYmNDHAQSJVRtThxykB+lcqraO9WX4tNUNmjkqBhYoPWGdM6g8WMjrfxebu/KJHt1iMbv7wyhA/e
	KKFHii+eFXOCIpMoGeKn7k+anS6Sa/u+Wyj+cYvxVIh1mX7YrA9oRg4keHYEWaV2s34R9CxkJCcpt
	AoqZJpCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtPfF-0004Mj-NE; Thu, 09 Jul 2020 06:04:09 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtPfC-0004MA-TZ; Thu, 09 Jul 2020 06:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1594274638;
 bh=TZyOZH4895BbG19FeNnP5yjeMPwsXxV4vbelAvplHBw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QzGYEHo/ptT18IdVlPW4bGbhNJ3dogQIgcIGYjAG4dOyZocKQ4e3askfNPV3wKbdr
 /6XN9Oq14ugCxk6UFZB+3GM6ivgm62kBtMMgUKEZh+fAArFA6M8JxsrpbQ3PgtEcjE
 g+ujCmNJuGmfxlnraKO1C8GwTMiyPNRcUae1E9Q4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.213.58]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MF3He-1k8ldY2LKS-00FSxk; Thu, 09 Jul 2020 07:58:00 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2] net: ethernet: mtk_eth_soc: fix mtu warning
Date: Thu,  9 Jul 2020 07:57:42 +0200
Message-Id: <20200709055742.3425-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Wiq1d0Rddq7HCel86HaixNIkmlj/ib233BDnqRUt+y8BT1RO3P0
 KCVI1KoqMaaeH+Jnk7aRF5LN5LWIrxCy5SoM6qHoojl1Y9q7hd4SEuQ9BsurAKmIh4IZ1zs
 UNKnFIkIvAaj38rFsVzNuw6Fm0S41lXvLr4TsfQFYfaz3gLFwQlhW+8EJwv0sZcbieLvfNY
 Hsx+dBl35UMvQTDEG5WYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wjD0Wrsji3Q=:1xI3LueD7hF5Tgdg+a9IKw
 Zohe0u++npHBMdPKovKMO7c1ju6ClrJs2C6EoKu/5NoWbHijS9AUhGRVX4tVUimchBPsE2R0N
 c2m/C953zBhkAuErvsiiWyl0RbgjPJPo+JLAZS22NPavk+vswmUq2NBIG98Xd8tNMZqvlLg5/
 gey479R8Jh5CwpdLSnjGvWH3WNL1jEfujQlJexk/MipwoG5Qg2A0+N2kNk7pdpnhwwQVHVxRj
 OE5HQX/DrYT0/OM5q9OVjR8e0za2+f/Kvrzf/IXFEHPlaBGeI9hk3PNPzKoWdM5e7rvl+VLOQ
 rp6HR8Bzhdsa9Y+70wtlkyzExTyy+c84etf5LYQbfs2HerybFMS/LQJhwcKEYn7Xwg3t5S0gi
 sWSvDK6/0mnrQU4zBAvojM34NRorO2duL0cMB9BxZzv2DyFUCUDbEkbI9wwQ1IhwzFD0geSTs
 9wP+6OGdYQAof2yRTkViFb/LA5sBZf7siuaQ+xjQZG/l5YLnWkQBCbdGHuB18hwC5GLnHxeIQ
 ZmwZrH3NY2pmyeR8aDs1riX/4yAsOoxHBQ8P8pEXmWRc9EXMBaQ+c3GThKCsjCbJZZY/+hv5u
 C4bgIKVsrAVpUr6VKSG3kLCp5FMY/mU5bBOBd/LZ0AfUlJahtbTEpA9yAAYHKfZSPvGzCzVQW
 jsDxUnRRoprle1uagKB6rPqZLD6ZYT29qeVU6Vs5j6Vf+Xi8Y4o8NB9pMi+6amezZg/MoKdtx
 O/glfLbcfbMGLQI05vi9MdNi3UpwlndNE6q3RSgsPqZ8+7AWi141EBfDttqbSBPxwXE1MBDSh
 e0FwQKAB0BCJFhT523tYK1w8eZcmCrlsB5TU/WMRMpLJq2OPoESmjqulnvjOrtx5Gsy0BgW3/
 ZraawfGfiI+k95WRF5YK/+ib+0PZU5AaV96So393xJ9mk4z32bQ1rw7WjX2/KtZ3jiErtSdh9
 Fwu15LtNaZwT/aEVpsNxRplHJFJH5whU/0LNyAeQr9sN04nJqKVcCDEQeAfc0Mgdw7udFe+Ve
 1voaZ9kqncogarjCO4m04af74pAhSZQvU/e7LrEjDg1hC3xCnqWDJbv48XeSJ1VW7GA0hEfv/
 uCSnfFPHPNzvPBlZ/j781etTeSwwz8xbzF06y5U0dKm4YHf+/Lin1PsG9PV2x3xNIsEfGZ3hG
 KYfyqil5TAAOMRvoBz0QHYBPwLPlOLwYo5D/mnqb97gk/65LO02Nq7uNz2N3N+rl33z7hfOUG
 X6ezcp38m9FgQppTOhUoSirqSO2zcfRcL49Wdog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_020407_155582_1C07A31B 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+CgppbiByZWNlbnQg
S2VybmVsLVZlcnNpb25zIHRoZXJlIGFyZSB3YXJuaW5ncyBhYm91dCBpbmNvcnJlY3QgTVRVLVNp
emUKbGlrZSB0aGVzZToKCm10NzUzMCBtZGlvLWJ1czowMDogbm9uZmF0YWwgZXJyb3IgLTk1IHNl
dHRpbmcgTVRVIG9uIHBvcnQgeApldGgwOiBtdHUgZ3JlYXRlciB0aGFuIGRldmljZSBtYXhpbXVt
Cm10a19zb2NfZXRoIDFiMTAwMDAwLmV0aGVybmV0IGV0aDA6IGVycm9yIC0yMiBzZXR0aW5nIE1U
VSB0byBpbmNsdWRlIERTQSBvdmVyaGVhZAoKRml4ZXM6IGJmY2I4MTMyMDNlNiAoIm5ldDogZHNh
OiBjb25maWd1cmUgdGhlIE1UVSBmb3Igc3dpdGNoIHBvcnRzIikKRml4ZXM6IDcyNTc5ZTE0YTFk
MyAoIm5ldDogZHNhOiBkb24ndCBmYWlsIHRvIHByb2JlIGlmIHdlIGNvdWxkbid0IHNldCB0aGUg
TVRVIikKRml4ZXM6IDdhNGM1M2JlZTMzMiAoIm5ldDogcmVwb3J0IGludmFsaWQgbXR1IHZhbHVl
IHZpYSBuZXRsaW5rIGV4dGFjayIpClNpZ25lZC1vZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3Bl
bnNvdXJjZUB2ZG9yc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFu
ay13QHB1YmxpYy1maWxlcy5kZT4KLS0tCmNoYW5nZXMgaW4gdjI6CiAgRml4ZXM6IHRhZyBzaG93
IDEyLWNoYXJzIG9mIHNoYTEgYW5kIG1vdmVkIGFib3ZlIG90aGVyIHRhZ3MKLS0tCiBkcml2ZXJz
L25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIHwgNCArKysrCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
bWVkaWF0ZWsvbXRrX2V0aF9zb2MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210
a19ldGhfc29jLmMKaW5kZXggODU3MzVkMzJlY2IwLi4wMGUzZDcwZjdkMDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMKKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYwpAQCAtMjg5MSw2ICsyODkxLDEw
IEBAIHN0YXRpYyBpbnQgbXRrX2FkZF9tYWMoc3RydWN0IG10a19ldGggKmV0aCwgc3RydWN0IGRl
dmljZV9ub2RlICpucCkKIAlldGgtPm5ldGRldltpZF0tPmlycSA9IGV0aC0+aXJxWzBdOwogCWV0
aC0+bmV0ZGV2W2lkXS0+ZGV2Lm9mX25vZGUgPSBucDsKCisJZXRoLT5uZXRkZXZbaWRdLT5tdHUg
PSAxNTM2OworCWV0aC0+bmV0ZGV2W2lkXS0+bWluX210dSA9IEVUSF9NSU5fTVRVOworCWV0aC0+
bmV0ZGV2W2lkXS0+bWF4X210dSA9IDE1MzY7CisKIAlyZXR1cm4gMDsKCiBmcmVlX25ldGRldjoK
LS0KMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
