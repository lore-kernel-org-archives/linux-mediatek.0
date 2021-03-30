Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EF9C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:29:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CA8619A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CA8619A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/zatzksTxuxQjyY9X2KKzowPzZ2X4XYgwTOwGVd1750=; b=JcAVHuOrFtj2xG8uIGybD88dZ
	LNVpir7cBujgxSwuyKRJQm+Yh4jL43VYKHSpPOSyG8n6WmyYMsJntbUFNsQ9JiLabUp8qH3CVy6Rk
	89Eiz0I9kPuj+rk3tmASfZDG6n4MvmrhZtNFodttVtemiO4udycRs1Z7/lFMbZNgG8MvlscA2pIId
	ZoVx4Qp72CWcD/O5mDmw9L6sI09OmcHuhxzS6JbVRZVRm1FL4QIHv5q1ZpLNpNKyOtWIXp5cyXfE4
	tQOzJdgjcOPSJUnWXiVj3BN2UFQkKYps/8lRaHAVsFMVwlSCzG8UvGZTFagYYcaC78jkfmBIV67wz
	vOIwDtWmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBcZ-003Osn-GO; Tue, 30 Mar 2021 10:29:15 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBcU-003OsK-Sk
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 10:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617100144;
 bh=J7ge415ND7aeyqqplpc/3eMvvT8vSf7Sw2urIEL/FQU=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:From;
 b=e2F7kAt08b2TbeBmwqocAiJvKGFYS+AGdMiSxpmv7hgXGeTR2+W28AFJ3bFe6hugY
 FgX+0q5N4IGQMv8t+iIJFniJzaefZjKNCoNeHb2xZbUp9aYUI/yqfhhbaTbz6pJSI0
 y3Zy4v9WayYuynK6cx7tSZl7epFEXFsxvQb3H27k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([157.180.227.125]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8ofO-1lefxR3KJa-015p55; Tue, 30
 Mar 2021 12:29:03 +0200
Date: Tue, 30 Mar 2021 12:28:58 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <1617084157-18652-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
 <1617084157-18652-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/4] usb: xhci-mtk: fix broken streams issue on 0.96
 xHCI
To: linux-mediatek@lists.infradead.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <08CD2528-BAE2-4C2F-92B3-6CF941FD0243@public-files.de>
X-Provags-ID: V03:K1:6cYfW3A9NVMVsWaS2IRNnFboQbx2zcPbm3WtZo9UqJAKJDztzaw
 CUmmHsizrIyRAybDz0dVYYU1yH4ryo9U6zL9HpLsnYnx60jaJ3Zp7fE+hZRwIvJCdie/kLa
 8KMOMcl5YumiXaEeNldcMXRl2PVF/QVlHnWetCZlFT1ld3+K4DVr+hQOox/ySo/1TGvPX6P
 CBEuZCZj61hMHa8wPmfww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b9gF3fXwnbE=:mJpB3KPOrd8P0QpOl07/VD
 BybSqsN3Ypb5ISeAVFXbvk6Btp4iLznGkf1C+STE8z3bAX3BEP02UzJurdrpCSFHrM+YCb7Xa
 2gW++GKYYA9RiVZlxqoY+mEm/bLcJeXuIAMuqqwM51hbbjDnpyaxMVzm1Ckjz4LPRNRLoQZF3
 VxQ1n7FGtWbAYSc06EDJved8N6GYHMCxpeNuMxWnZxYizKEKnaqVCck4w8XroxE5BD7fsVvvx
 gfVhDGwCk/s01EWDnvSRoWnqGFXFcyjOjT+FEZCvLxZNYMgau/4t/eAImR7C8Xszk2mOcxTsv
 epL7cRd1DkEGjmJ/B3+GKe8wFKqZCFweuYtEmIRmCePhPaeex/1DB2vuEbyR0w1svvbDCkV+b
 5Wr9SY6wUtMnXCNGJtLJVcW9rIt+DOqyom1f0DvbFM4+WHNfmDMCihebESoSCrZDar1DmOGlr
 vDkYjoiXe01gUTifO59CqXMr47HgZxidmJdAmeMSjfOAdxtxKWan/OPSOojhTlcsBFgA22t9V
 WiKoctUYbkjxCEmB+zXLY0k3369ZBCIsW0GKRQd7NdwN+7lGQ7WDJkUxIM/YXhQcuT2xJaK+g
 8l5ut16W7OyiAwonA7HzpuhCxE2H363Gkrtgw+rLWQvlhtCKISetmOE5dsVwAQ5Ge6mgBEqp4
 T5YSCaWKhwub85weIAjY2Lg+drFZa9mtEAs5SK1kVR3OERtQ7rO40lbHna64CE7NUFLa7/tuv
 Xme7DiJrbiCUoKvT0LXoOeKJYAgl1S6JYMhPwdGd645kg0QvIrOfJi76e/W57u8Yu+7skEyzV
 iC55+PRi7RWpvKfUudDXu5Cy8+jdO2eWJDVbb27A6+2s/79vcIg4/L5QC67FQToOkrYIo6zqK
 BJuRSsWiDsCB49Rs3cSSxsQLA532zVEWbx52YEL+wwmyl5DHVN4jYncuH72WU6NZPwfiQrtcq
 oXQIQUzUSKP33u+onfRZjUeCEQsi0ak2X+HrPXXbUoimnePu+r7UE2fOoKUa6Q7QFvQ4CqrZM
 6hkUeM5E7Q95+fzC8sGfOAujY5w3JqpM+AkdQdPXEmjp5TlIiLetiTNHAf/dyTHgDu+jl52V1
 kNLzbzz/G5rDGPbkQu9/5aOwAa8+sX3uZZm/cYudsQbd1+DTnt6hPHC80mRsE640t6yq6TZV6
 9ieH1lqgu+l5onUMxqjjEJEp7P9ncRKlGMb87fhtznKrWJQbF60g6Dx798q7QHpLt+NUsqYt1
 NGRznpazjyHpJ0l/B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_112911_096856_66A0E6E5 
X-CRM114-Status: GOOD (  10.17  )
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

QW0gMzAuIE3DpHJ6IDIwMjEgMDg6MDI6MzYgTUVTWiBzY2hyaWViIENodW5mZW5nIFl1biA8Y2h1
bmZlbmcueXVuQG1lZGlhdGVrLmNvbT46Cj5UaGUgTWVkaWFUZWsgMC45NiB4SENJIGNvbnRyb2xs
ZXIgb24gc29tZSBwbGF0Zm9ybXMgZG9lcyBub3QKPnN1cHBvcnQgYnVsayBzdHJlYW0gZXZlbiBI
Q0NQQVJBTVMgc2F5cyBzdXBwb3J0aW5nLCBkdWUgdG8gTWF4UFNBU2l6ZQo+aXMgc2V0IGEgZGVm
YXVsdCB2YWx1ZSAxIGJ5IG1pc3Rha2UsIGhlcmUgdXNlIFhIQ0lfQlJPS0VOX1NUUkVBTVMKPnF1
aXJrIHRvIGZpeCBpdC4KPgo+Rml4ZXM6IDk0YTYzMWQ5MWFkMyAoInVzYjogeGhjaS1tdGs6IGNo
ZWNrIGhjY19wYXJhbXMgYWZ0ZXIgYWRkaW5nCj5wcmltYXJ5IGhjZCIpCj5TaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4tLS0KPnYyfjM6IG5v
IGNoYW5nZXMKPi0tLQo+IGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGsuYyB8IDEwICsrKysrKysr
Ky0KPiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLmMgYi9kcml2ZXJzL3VzYi9ob3N0
L3hoY2ktbXRrLmMKPmluZGV4IGMxYmM0MDI4OTgzMy4uNGUzZDUzY2MyNGY0IDEwMDY0NAo+LS0t
IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay5jCj4rKysgYi9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktbXRrLmMKPkBAIC00MTEsNiArNDExLDEzIEBAIHN0YXRpYyB2b2lkIHhoY2lfbXRrX3F1aXJr
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj5zdHJ1Y3QgeGhjaV9oY2QgKnhoY2kpCj4gCXhoY2ktPnF1
aXJrcyB8PSBYSENJX1NQVVJJT1VTX1NVQ0NFU1M7Cj4gCWlmIChtdGstPmxwbV9zdXBwb3J0KQo+
IAkJeGhjaS0+cXVpcmtzIHw9IFhIQ0lfTFBNX1NVUFBPUlQ7Cj4rCj4rCS8qCj4rCSAqIE1USyB4
SENJIDAuOTY6IFBTQSBpcyAxIGJ5IGRlZmF1bHQgZXZlbiBpZiBkb2Vzbid0IHN1cHBvcnQgc3Ry
ZWFtLAo+KwkgKiBhbmQgaXQncyAzIHdoZW4gc3VwcG9ydCBpdC4KPisJICovCj4rCWlmICh4aGNp
LT5oY2lfdmVyc2lvbiA8IDB4MTAwICYmIEhDQ19NQVhfUFNBKHhoY2ktPmhjY19wYXJhbXMpID09
IDQpCj4rCQl4aGNpLT5xdWlya3MgfD0gWEhDSV9CUk9LRU5fU1RSRUFNUzsKPiB9Cj4gCj4gLyog
Y2FsbGVkIGR1cmluZyBwcm9iZSgpIGFmdGVyIGNoaXAgcmVzZXQgY29tcGxldGVzICovCj5AQCAt
NTcyLDcgKzU3OSw4IEBAIHN0YXRpYyBpbnQgeGhjaV9tdGtfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZQo+KnBkZXYpCj4gCWlmIChyZXQpCj4gCQlnb3RvIHB1dF91c2IzX2hjZDsKPiAKPi0J
aWYgKEhDQ19NQVhfUFNBKHhoY2ktPmhjY19wYXJhbXMpID49IDQpCj4rCWlmIChIQ0NfTUFYX1BT
QSh4aGNpLT5oY2NfcGFyYW1zKSA+PSA0ICYmCj4rCSAgICAhKHhoY2ktPnF1aXJrcyAmIFhIQ0lf
QlJPS0VOX1NUUkVBTVMpKQo+IAkJeGhjaS0+c2hhcmVkX2hjZC0+Y2FuX2RvX3N0cmVhbXMgPSAx
Owo+IAo+IAlyZXQgPSB1c2JfYWRkX2hjZCh4aGNpLT5zaGFyZWRfaGNkLCBpcnEsIElSUUZfU0hB
UkVEKTsKCkhpLAoKU2hvdWxkIHRoaXMgbm90IGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlPwpUaGUg
Y29tbWl0IHNlZW1zIHRvIGJlIGZyb20gMjAxNwoKSG93IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWU/
CnJlZ2FyZHMgRnJhbmsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
