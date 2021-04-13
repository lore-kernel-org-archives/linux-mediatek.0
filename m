Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46824C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 21:40:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DBD613D0
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 21:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1DBD613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uy+tKAD0/lin14G1Xf+m3BumZaPVJcx+tJvJM7H+KB0=; b=lSJjNNT0ebCW02QmeKN53wBOB
	FQnYn2ivqIkAI5quckG+yOQa2V++RdAQm6qDSm+Nc3kbGIobCsczV5/aKPIyp5uxjQsUZ35oc/dvE
	cYGvGl75io5sN3SkxgxearPyaTnCAK5IKvLg5tF+HnBzgsAQQBXvLfIh7dXNDNXtx6e+0sY/jx80+
	byZOEXMda9wLxdfXFl9xtoLD1/mNd/BoAPStcfl2cTnwxUtTpebgJK0S2V8+6J8Li5EybaCbOf4Ij
	xR2nWAvpkByWbc55nwUhgPwQXMhFf2Klt3gFp11yjjnsziy7HRrC02cToPw4JJYc2F8c+Sun25rLv
	wt3h+pCAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWQlf-00AaT8-KA; Tue, 13 Apr 2021 21:40:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQlc-00AaSa-0O
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 21:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eiQHlCl2sZCYlKfHMuobBHiRWii+iMBBV0XuUlBpdNw=; b=dBLqtVUzAt/TIC7HwXIhvjyBPU
 rcnvOXAsKjrqbWD5YKuHMXqR/KqWbuMvYeraWhl0K/ehk+R5g7iN9xLZWT0Etq2y+dlnPMyNqdZl4
 udiy1PQ43pJLGtbZvTxdrPTNCKLq+a+fS2W02qFRtKfaoYXh9sckPPNLJoAxmBQIBhSb/oRG3fmy4
 OD7Gxf1me+SVlDPcNdCx9diYgaw5cLelZWFVGY+D6M30uAWXhQLMvShhFmo9h8YzwlxTbcW21yWt6
 gxJNLOcShc2Us7m+baUo6qjvvX+CQjRgW5LKdUNxyohQvfEq6N5qG0eqR5/hcxIR3TiN4ervk9RUn
 fU8zt9Bw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQlZ-007L4F-HT
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 21:40:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 95FCB61244;
 Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618350012;
 bh=Pc42y9BwpCcvBnEOgNEkzVDFAHE768WYwvYWqxdzGrY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JpKPcXvDY3jbjWj2NUFrxhqLnY4MycEY1lwF1U77EVzHfs11AOJZ3vxLYy7e64C79
 icoTd8xMRa/JMoMeNAdPJbFL15Ic+obOTqTbZR73MlKS7rcM5AjmiPGUchq4dzktE3
 gIL+eyYasiMs+hvD4EML/cii3VlQjj02UYCxlSUrdrh4uXtAavbLvMAy4TlRuGrBvF
 DkMFAHYTwMpcujWy/WPPgAsc47+r6tmr1oF3VInnDCFSI58U77eyWfrJmO2S6/f2Eb
 PDNOzXJaRKzFdSTmv1YWrXny2oNlXQPJ3hoUxLyA1sKNTFyW80ZUMgxjpqg1ocDuAJ
 vc4ugCS+TbXOQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: Add support for EEE features
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161835001256.18297.14223110480767225137.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 21:40:12 +0000
References: <20210412065031.29492-1-opensource@vdorst.com>
In-Reply-To: <20210412065031.29492-1-opensource@vdorst.com>
To: =?utf-8?q?Ren=C3=A9_van_Dorst_=3Copensource=40vdorst=2Ecom=3E?=@ci.codeaurora.org
Cc: davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com,
 hkallweit1@gmail.com, kuba@kernel.org, Landen.Chao@mediatek.com,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, sean.wang@mediatek.com,
 vivien.didelot@gmail.com, olteanv@gmail.com,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 sergio.paracuellos@gmail.com, frank-w@public-files.de, dqfext@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_144013_617351_D0768646 
X-CRM114-Status: GOOD (  10.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIG5ldGRldi9uZXQtbmV4dC5naXQgKHJl
ZnMvaGVhZHMvbWFzdGVyKToKCk9uIE1vbiwgMTIgQXByIDIwMjEgMDg6NTA6MzEgKzAyMDAgeW91
IHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBFRUUgc3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSZW7DqSB2YW4gRG9yc3QgPG9wZW5zb3VyY2VAdmRvcnN0LmNvbT4KPiAtLS0KPiB2MSAtPiB2
MjoKPiAtIFJlZmFjdG9yIHRoZSBtdDc1M3hfe2dldCxzZXR9X21hY19lZWUoKS4KPiAgIEFzIERF
TlEgUWluZ2ZhbmcgbWVudGlvbmVkLCBtb3N0IHRoaW5ncyBhcmUgc2V0IGVsc2Ugd2VyZS4KPiAg
IFRoZXNlIGZ1bmN0aW9ucyBvbmx5IHNldC9yZXBvcnQgdGhlIExQSSB0aW1lb3V0IHZhbHVlL0xQ
SSB0aW1lb3V0IGVuYWJsZSBiaXQuCj4gLSBSZW1vdmVkIHRoZSB2YXJpYWJsZSAiZWVlX2VuYWJs
ZWQiLCBkb24ndCBuZWVkIHRvbyB0cmFjayB0aGUgRUVFIHN0YXR1cy4KPiAtIFJlZmFjdG9yIG10
NzUzeF9waHlsaW5rX21hY19saW5rX3VwKCkuCj4gICBwaHlfaW5pdF9lZWUoKSByZXBvcnRzIGlz
IHRoZSBFRUUgaXMgYWN0aXZlLCB0aGlzIGZ1bmN0aW9uIGFsc28gY2hlY2tzCj4gICB0aGUgUEhZ
LCBkdXBsZXggYW5kIGJyb2tlbiBEVFMgbW9kZXMuCj4gICBXaGVuIGFjdGl2ZSBzZXQgdGhlIE1B
QyBFRUUgYml0IGJhc2VkIG9uIHRoZSBzcGVlZC4KPiAtIEFkZCB7R0VULFNFVClfTFBJX1RIUkVT
SCh4KSBtYWNybwo+IC0gUE1DUl9GT1JDRV9FRUUxRyB8IFBNQ1JfRk9SQ0VfRUVFMTAwIGFyZSBu
b3cgcGxhY2VkIGluIHRoZSByaWdodCBNQVNLIHZhcmlhYmxlCj4gCj4gWy4uLl0KCkhlcmUgaXMg
dGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFtuZXQtbmV4dCx2Ml0gbmV0OiBkc2E6IG10NzUz
MDogQWRkIHN1cHBvcnQgZm9yIEVFRSBmZWF0dXJlcwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9uZXRkZXYvbmV0LW5leHQvYy80MGI1ZDJmMTVjMDkKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsg
eW91IQotLQpEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJu
ZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
