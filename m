Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A30C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 12:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824FB217D9
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 12:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iUEyI1Su";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="BhQ0r5PE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 824FB217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QX3OJj9vEOP1i/kzH/fyyjGvdf2ifQ3xHOXEcTxJa6A=; b=iUEyI1Su+j6NbeOlrueuHy+VoP
	RRoLyZlpZ4AY8rXDTEJzDeXU48JcwOG8z53Ek1/Cd+HD6BMgNIzGHX1yLdW7A7C8Yl7fpA327xG9P
	yItI4vgKEQfa7yII7/lbSKNpSpA5oUi27aVG3fet8wUy/HTbTwavSh9LJj4UuYoVf2S+oHw4IREgL
	5lKrTgWuD26EFhBDzwN7AAxuo7rFWRt6fM7dOY7xs4flSx6y0wh7W1/CPJDP/k5hHDFxMs1VozYaJ
	pab875spskfiVvBS02EUOAtU7cSK5Cdm2cl7aAcUU4cHp41jqVu5vf+dXxf3Xp57Zq9eJLy1YVskr
	dJkmci9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp9xM-0002G8-7Q; Sat, 27 Jun 2020 12:29:16 +0000
Received: from mout.web.de ([212.227.17.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp9xF-0002FF-Sc; Sat, 27 Jun 2020 12:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593260932;
 bh=q62EpVbWJx/C5CeZjvOTrIDq+9P24N4wnNIK589Smok=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=BhQ0r5PEmJTuvxGMhQm086sTDUF0SNY3Z+6a1+k6qCnaoLPaGnvhPAO9+kT9VZaQX
 P/dAO+8hSRO2Nr2WDDeInZaprSucBL4hrJF9rojUxLHEuSRcGB21Dq8ZreyhEIfK9v
 EGVDHTykkqTUl3MYv84fOFYkmWHUSzkMGfetZPs4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.65.31]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LzK61-1il2gM3vPN-014UaH; Sat, 27
 Jun 2020 14:28:52 +0200
To: linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?usb=3a_mtu3=3a_Checking_initialisation_of_the_variable_?=
 =?UTF-8?B?4oCcbWVw4oCdIGluIHR3byBmdW5jdGlvbnM=?=
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8efdb7aa-1188-e94a-3075-ab1dd30768bb@web.de>
Date: Sat, 27 Jun 2020 14:28:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:7OCPy2SUdBcSv+8Mxzo/aqtRU6s4oCsiraPxPzp2IeYy+h8LBLu
 qITYLg3yidz7IaYHotwH6v8kRkea9+B1hs+uE4JrmK6nbIkKEwL9FexTN3oGOxS7JKw9w6/
 kFWv0FZYOEoLpBF/2vz/eLzN8/6rxV2Vc7n+xZJ1AlD9ChFotrZ32WZFD3aqOuil3Yi2+KY
 xJjXsU0I/JlYXffQx5QRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P5C09fY/Evc=:HsOwc16QAcSGGv0Oz6DxOE
 3JCVhTiTIUjkWalHu3U24o2RvMCm397xO3AT7MFHthWc9yabvoxzmfGUoZt3bKanMhTKlTHQC
 6ldte0d8QOJHRMNtsHZDd2U0Q7ylrxhU4cW7TvsfzgREuVIbudmaFpnPkwudc/iFjd2cxob8U
 TmW+f1QKwDYgbt07GYaqePqRj9ixi/w2YRxFEQN0izjKaECIMu4HyDgB2i83NLm4ayGTSBiLC
 +cwkA1S76RM/WBwq+4dN1klIHr3amDPX08XkgNw7H5W87uoPLrq8pptOTTJr1gaSyZ5TBu1xn
 /17dlzJVcJdmM1s4S6VrNjCu+IlDoCiV6wP3J+A3FReKNOxPa/ks3Elj5IieW9SfhKc/0ZFZg
 K+bz0cwtm3u6MePg7+sLWPEAidU7xn9713mAluibYrU+i6/ieMqW/KJBrxAs4Gds4KDqONupI
 Zei7/N2ABlL7Qtw0sEd13ssNBqE8fIkRiDcV8ffQhEvnyyzbgtWhabq9t55Jjye7Adl4ijesg
 N9v3BjP6bSACb0tsjhC6hxPTLyZv9XUmFsezzsqdX2rwCWfXWn/eX2r7AwLmXJ1alp5hQ5EXr
 If33YeTVNmzUI/17mxddt6U1TBEdTj0FLUuwRoqMQk/zaHx53qChdwiB77W57IvDai081O7yJ
 1jtBaK6jFyU/JL7wuz8pw1cG0ky4cIKzoz8gJ7uZkJt7GHjyohryfPkp0+hDTUSjv9XNYxrbs
 UI26fRKO/sLB0BKQ6fGt579wpTjI7vPLN2kTgIVPq18+E8BNuZSRii7n+PksRfObnx0v5AFQB
 Ha5AUIZSC1B+/qtUw9+MFad6Kd85d8ig8DM9dF8pfKm09gu4FCjEyohpFhuU4SUXaHBAQfFSI
 XaXSvJgglFdihOqL2pPTKAZ9m0mUxnSv0FE8vJWV+CEj2bkJjN6hd14fJdhbLJkB/ovmoltsa
 meXsPfDTBtch53hkk5zf3y8Z5qMQ4vDRQSRfwnOqYqwNWa9D9/5JiBEGUFe3OJdrOfCEvaRJc
 UwttMqHG1eDVRKoPuZGDplknFMjMLzgs/lqXefIy7oR8sJ60M/xkY0oDRD12bomvZYMWzukYQ
 1Pi2MINu8RwgBsk8XUZC3+KIl7WEJCjHIG0R2EpOHnAy/fvshAlyzHZvq728JODAQuXPM6Yz1
 s1wvLWkOhPvSU5TY8lvsSSUs6hOwtCyg+j3SRkEnAU+USDIEzLLrh3nWCqZOYPI1HhBx+rgWN
 tCfr2kgU7pPGpLxTcvg5u4GzoBherTKCZyUweDw==
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
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBIHNvdXJjZSBjb2RlIGFuYWx5c2lzIGFwcHJvYWNoIGJ5IHRoZSBtZWFucyBvZiB0
aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2UKKENvY2NpbmVsbGUgc29mdHdhcmUpIHBvaW50ZWQg
YW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIG91dCBmb3IgZnVydGhlcgpkZXZlbG9wbWVudCBjb25z
aWRlcmF0aW9ucy4KClRoZSBmdW5jdGlvbnMg4oCcbXR1M19nYWRnZXRfZXBfc2V0X2hhbHTigJ0g
YW5kIOKAnG10dTNfZ2FkZ2V0X2VwX3NldF93ZWRnZeKAnSBjaGVjawphdCB0aGUgYmVnaW5uaW5n
IGlmIHRoZSBpbnB1dCBwYXJhbWV0ZXIg4oCcZXDigJ0gaXMgYSBudWxsIHBvaW50ZXIuClRoZSBl
cnJvciBjb2RlIOKAnC1FSU5WQUzigJ0gd2lsbCBiZSByZXR1cm5lZCB0aGVuLgpodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9kcml2ZXJzL3VzYi9tdHUzL210dTNfZ2FkZ2V0LmM/aWQ9MTU5MGEyZTFjNjgxYjA5OTFi
ZDQyYzk5MmNhYmZkMzgwZTAzMzhmMiNuMzcxCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y1LjcuMi9zb3VyY2UvZHJpdmVycy91c2IvbXR1My9tdHUzX2dhZGdldC5jI0wzNzEKCkNh
biBpdCBiZSBuaWNlciB0byBhc3NpZ24gdGhlIHZhcmlhYmxlIOKAnG1lcOKAnSBvbmx5IGFmdGVy
IGEgc3VjY2Vzc2Z1bCBjaGVjawppbnN0ZWFkIG9mIGFuIGluaXRpYWxpc2F0aW9uIGJlZm9yZT8K
ClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
