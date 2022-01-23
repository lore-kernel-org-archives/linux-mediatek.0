Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2734C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jan 2022 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAcPGGhqf7VeHD0pUPSAK9YiLP5Tf3JFoUkU7kD+2Uw=; b=c5u/BrP5153CAi
	XbBkWcz+425SWAVsPLcK8muOsVrqGafYjNqYyqy3gzJO/+r6phcQa5RbHV534/ihudLM6fYKCd/dl
	AqNFZj4WrXs4USZHKdu3/2E67vbSxCQ/+DYbZBLm/q+cxCDDLjdEV300aZCj+rCV1i3iwUGVJTPbR
	lWpBO3VZQloUQZ1lUx7Z20st9offtVX5TzfwlTF6ktR6ePyDgt6U2mmzygT0WcZyuioakVNMiqXeZ
	DmGUIbFJBEkK4Lky2/NIVpLbG7lc/oHzLIW7eNOJQbF6jxCmKf9/6g6urSUGF91ogGy6sNvUvlVOq
	/QdbAVbHndxCwzmj83dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBYJY-000TCg-HV; Sun, 23 Jan 2022 08:33:32 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBYJR-000TC9-4q
 for linux-mediatek@lists.infradead.org; Sun, 23 Jan 2022 08:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1642926791; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UEM8SjEDx008A9t5vs3nG2qeP4NsC/+JKMgHHzxUIsIPW3F/9SXE4HPmHOO4+aNesEqX5pn33L6CS1KJQqVH7wea2P2AlxlMK7lhtcPsrDX4iXaD43RsU19iU972lToYEIZcwWjCqnqUJWi8Nrb3UPev6F46/eS5jdHH8wUJ9lc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1642926791;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=zGbxDYRTYsCzoHNVUcU5t+8ReMmKxJuY1o4AwKRRb0w=; 
 b=II0VwVD4g0VVNgnbEoA0FKB5CAkS0VrjME0VOGCQ1LPayFcqvz+yl5vL39ujPgJEfLtnv4b4IZQg7DETQ6tGyasjRz7OR/i9RvV4Zqh2YFIcvc0gI5J1KdGW47KyD7xHWMofy0wF2KvlsvmS4cqYFiUGxntyw8P1N5vm0rNgjhw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1642926791; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=zGbxDYRTYsCzoHNVUcU5t+8ReMmKxJuY1o4AwKRRb0w=;
 b=KxwGjN17pINllD0XcsnaaCkD8TaO8+LnWe89Nein21vY1qANrB/2yEBBlXzBB4jH
 Y2LyZFZEw7ku3cFZK88CJKla8+dtOXLMnR0dPDfB4Z75+Wz7Mr/nUSFOhFqCNwJUd1H
 t637xGky0Ni86z4yTSYsDrt5Yx47xZacFs2ixjMQ=
Received: from [10.10.10.216] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 164292679058419.182476398373183;
 Sun, 23 Jan 2022 00:33:10 -0800 (PST)
Message-ID: <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com>
Date: Sun, 23 Jan 2022 11:33:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, openwrt-devel@lists.openwrt.org,
 erkin.bozoglu@xeront.com
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
 <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_003325_287395_9ADBEDF6 
X-CRM114-Status: UNSURE (   6.69  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGV5IERlbmcsCgpPbiAyMy8wMS8yMDIyIDA5OjUxLCBERU5HIFFpbmdmYW5nIHdyb3RlOgo+IEhp
LAo+IAo+IERvIHlvdSBzZXQgdGhlIGV0aGVybmV0IHBpbm11eCBjb3JyZWN0bHk/Cj4gCj4gJmV0
aGVybmV0IHsKPiAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gICAgICBwaW5jdHJs
LTAgPSA8JnJnbWlpMV9waW5zICZyZ21paTJfcGlucyAmbWRpb19waW5zPjsKPiB9OwoKVGhpcyBm
aXhlZCBpdCEgV2UgZGlkIGhhdmUgJnJnbWlpMl9waW5zIG9uIHRoZSBnbWFjMSBub2RlIChpdCB3
YXMgCm9yaWdpbmFsbHkgb24gZXh0ZXJuYWxfcGh5KSBzbyB3ZSBuZXZlciB0aG91Z2h0IHRvIGlu
dmVzdGlnYXRlIHRoZSAKcGluY3RybCBjb25maWd1cmF0aW9uIGZ1cnRoZXIhIFR1cm5zIG91dCAm
cmdtaWkyX3BpbnMgbmVlZHMgdG8gYmUgCmRlZmluZWQgb24gdGhlIGV0aGVybmV0IG5vZGUgaW5z
dGVhZC4KCkknbGwgc2VuZCBhIHBhdGNoIHRvIGFkZHJlc3MgdGhpcyBvbiBtdDc2MjEuZHRzaS4K
CllvdSBzYXZlZCB1cyBhIGJ1bmNoIG9mIHRpbWUsIHRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgpDaGVl
cnMuCkFyxLFuw6cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
