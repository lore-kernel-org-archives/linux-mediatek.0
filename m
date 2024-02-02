Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C14C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8FbzhVSdLfklr8hKZABlXOconqepdqJvPclL8CJtQg=; b=Jwjg4nnwJ+BZxKuNJgEZhjqzbR
	5UrgZohq/IRtsjuMVY4y29FeNw+OzdqoDrSwVblpfquG+vZLKdGvOIUVj3jS/bGHX1radPHQuIydI
	LhWxJiqtZz/8ZBZ/xee8t4XUDvb/Y9HsVsM8jTOcyJnqzuC7QHGuGx+1e7pZp93HCCOw+VM3HPCx3
	OHGBwmfM6/pwZ6GRkkh+zY6jM/CqbSMJSmnlun8SkVlJewo8c1V0XwJnibh0dfIFGvEUN2ZlGrg/M
	q6OILd4mDzNd8ORvIAA5hrdg3j7isdJFQaeEKMe53Dw/2Pe14WQM1CJjnUpscVu0Wda6qLoI7mcv3
	51BV7zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsiu-0000000BUPe-3SLO;
	Fri, 02 Feb 2024 12:32:48 +0000
Received: from capella.uberspace.de ([95.143.172.251])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsip-0000000BUKu-43S4
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Feb 2024 12:32:46 +0000
Received: (qmail 22753 invoked by uid 988); 2 Feb 2024 12:32:29 -0000
Authentication-Results: capella.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by capella.uberspace.de (Haraka/3.0.1) with ESMTPSA; Fri, 02 Feb 2024 13:32:29 +0100
Message-ID: <55d28d61-1e63-41e3-a2d8-564edc85bcb4@7183.org>
Date: Fri, 2 Feb 2024 13:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WiFi adapter ALFA awus036axml - trouble initializing USB
 interface unless bluetooth blacklisted
To: linux-mediatek@lists.infradead.org
References: <d0965703-847c-4903-9ee3-f4fde7f71370@7183.org>
Content-Language: en-US
From: Harald Linden <harald.linden@7183.org>
Autocrypt: addr=harald.linden@7183.org; keydata=
 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 ow==
In-Reply-To: <d0965703-847c-4903-9ee3-f4fde7f71370@7183.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KElI5G8JJavXDQFgL5k6AU09"
X-Rspamd-Bar: --
X-Rspamd-Report: MIME_UNKNOWN(0.1) BAYES_HAM(-1.099792) XM_UA_NO_VERSION(0.01) MIME_BASE64_TEXT_BOGUS(1) MIME_GOOD(-0.2) MIME_BASE64_TEXT(0.1) SIGNED_PGP(-2)
X-Rspamd-Score: -2.089792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=7183.org; s=uberspace;
	h=from;
	bh=m8FbzhVSdLfklr8hKZABlXOconqepdqJvPclL8CJtQg=;
	b=lLy0fP0hSQPqqJ7y6VcgSb/pqrlBiO+KTz99XHcmeWWyjCsFgfClktTRCXlSz2tFRFoRhrf+mP
	4RDF9nzV1iWG34A87pbfMeW/AnK/djNLLqqWv3IgUGSfeLqZtBT6jzvVXGJj0MYitJE93wB1/DV0
	8SpYJmPj8hKLfQ2JZ5OzsM5kdxy8+rRV4x0Sd4pv3ucD/pQFTYi2Es/pKvUtpkkYVXEho/5YExN0
	vFEaVYVhySsoq1Y2AeLEumMQJtInTgg311te1cgCGLznq1fkiIHTSTWao36LiH8CpDEonHASXAxZ
	MOX6MEWT1KaY2SRL7srIjAIUA+M9ymsA4NWLyqfWr7d2ZcfdKKgBhXiMpI9VHh45XIlNJGdCSTnM
	NB0XD+BljQk8l9SvvtowLvkxldjXS46JbPZTbJkrv/QlA8QqCsuQSYqZ8/P1JHtmBOeERNVfYk9P
	qUCwAJc2tSTRT3CQ/7iGLgAKFsHSwyLk0CbcXtnP1rXJ4gey/ZkqQ4QRmG1FUEx5Uv7XXgBoaBId
	jxAY/Z6pvsnUPIjaBTfbI2rgpcD9r6zaiL8LRI/c3XM+7Y7M9zijoBvl3fjx/VLEu84kB5g/bDXq
	qwjeC7VsxvAnY3Z1W7R/1i8bxmkdI4PvpTSqh5Z1cU39kFioZeLQDL26Qgk02TqX4Yk1VPsBVoyn
	o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_043244_388422_F3C437F5 
X-CRM114-Status: UNSURE (   7.04  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KElI5G8JJavXDQFgL5k6AU09
Content-Type: multipart/mixed; boundary="------------t9U9joqyIcFy3MaQ0fDVX4Kj";
 protected-headers="v1"
From: Harald Linden <harald.linden@7183.org>
To: linux-mediatek@lists.infradead.org
Message-ID: <55d28d61-1e63-41e3-a2d8-564edc85bcb4@7183.org>
Subject: Re: WiFi adapter ALFA awus036axml - trouble initializing USB
 interface unless bluetooth blacklisted
References: <d0965703-847c-4903-9ee3-f4fde7f71370@7183.org>
In-Reply-To: <d0965703-847c-4903-9ee3-f4fde7f71370@7183.org>

--------------t9U9joqyIcFy3MaQ0fDVX4Kj
Content-Type: multipart/mixed; boundary="------------3SCJ1qo4SETPcucEjqzzknba"

--------------3SCJ1qo4SETPcucEjqzzknba
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T2theSwgSSB3YXMgb2J2aW91c2x5IHBvc3RpbmcgdGhpcyBpbmZvZHVtcCBpbiB0aGUgd3Jv
bmcgcGxhY2UuIENhbiBzb21lb25lIGhlcmUgDQpwb2ludCBtZSBpbiBhIGJldHRlciBkaXJl
Y3Rpb24/IEkgZ3Vlc3MsIHRoZXJlIGFyZSBtb3JlIHBlb3BsZSBvdXQgdGhlcmUgdGhhdCAN
CndvdWxkIGxpa2UgdG8gc2VlIHRoaXMgYWRhcHRlciB3b3JraW5nLCBhcyBpdCBpcyBwaHlz
aWNhbGx5IHByZXR0eSBuZWF0LCB3aXRoIA0KaXRzIGRlZGljYXRlZCBTTUEgY29ubmVjdG9y
cyBhbmQgYWxsLg0KDQpIYXJhbGQNCg==
--------------3SCJ1qo4SETPcucEjqzzknba
Content-Type: application/pgp-keys; name="OpenPGP_0x5D4E9B001A24BA03.asc"
Content-Disposition: attachment; filename="OpenPGP_0x5D4E9B001A24BA03.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFTbe8QBEADgbZTQ9FUkVpzxIKC6TaUOI4J9coFcd85R/kwFqdY1VWNVtOha
a4EGNL6FCyc1s78KO4MBo+5nmTqDaT+GgNSkqMGL2HHn09fTll/Eu/f0vbuaa0b0
Z9KJOEwDQnEBvIsgO7NtVHjnLEUSdMFLl4buQJNu3pizZ+ID6y+zmQAy1vGpSt3I
nEiOtQgi0hXx8do35SeUMmLvp2clzo4UIudD/tpu9WwsW0UASD2n/Q5DuBiSUALT
/0UTkNVkh1Dp4Ge2iEAaIR0rSDqyU5CitEtLzWYysNwzWcLKXZ1fVUNJi2sJcjm2
nS6hoBWS7Nw+UOsykymfjMksM1rblzr/yE08k4lt8YvuvDnJNmpNfq9GA4pW9hd/
4Ew/BCgPu75NB5E27SM+cxu58dqpCtyZPasC+4bmlAPBqcNBubSmyBkYg97Sr60D
TwPcHFClhqSXbVUzpmsHpn9tnIc73cs8V/NnoqJEhtWACnkpiGlHTdCzFZQA05m/
tAcTk6O6UKGQrR2fS8nPy6ofB5WI11pQZollqiY0UuyH5HvIpl+mlOddNt4pbPPd
dlqi/300WTteC+IehViRt44CvSbS73AVj2sSd+5V4KtTusGjVQQ1L5mOiAgyCaAP
672TSRYzmEqPXvpQJfw8ERsbwOFXd0Mz+wSAkJwN4rwXAx5LJBYtZkKAFwARAQAB
zSZIYXJhbGQgTGluZGVuIDxoYXJhbGQubGluZGVuQDcxODMub3JnPsLBegQTAQoA
JAIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAUCVNu1fwIZAQAKCRBdTpsAGiS6
A5AuD/sFHxWlM1GHE7Yo4uthCBQVTE7MuRWbeP3sZQ5TQbrxvdh0h2LwRqvxTxoo
SZIGQ611TvzlUCfFKvXApn11U4wwEiB5RnAxGPSAVCWpgmKTBBuywu5a1hVUlmyS
MYzbwNXE5w0KRj9mPcubtJd/ftWGrKTp0qEKFR06vsiV7Tnh3StlILKrGggIF7g6
jjz8LwkV0uf4jL71y03+Yrf7KVmlOfsOKBtgJr9UGak4GV66v0sFGw3kRs1etNlh
7b2R4gkGVdETLCfW9qNxM3cifEnbd7rUJwA5Ti8EASKs+tDX5xzQl9CoMX1Kl1Cp
5GuEfXKvoqJY5BG2vQVZU3wRuG7DZjpeSQAqG5yQG3xeULyyI7+mt4kMR7mVRtWg
MALQajrscQ/+ZrSubzWFQaq0d4BOaZ0w4dWYvy92RyEaqMzyRwsPZY8jdOkSvpHu
x/4BOb/3TLD+UTOYCK1pVGwk1n/5X/sRoc3zmp+i8ZjTjR325aRW5iHwQMqyO0KX
P50vTyUuuuUy+ZSA8FJrPGtoh7WJWzj74E1A8pG9JKbUEvb071I3nlmOoY4msBUW
v7DgKPfXP6qI7m7CCS0+cvSjhO/O7N8uuXPzGpJ3yncKvt/UlZzebuCrfg6D1RBd
+ZDbCvhcWtaSBnp9840Rq3hfp2kc96i/+aer7x5nMGB5NKD5QsLBdwQTAQoAIQUC
VNt7xAIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRBdTpsAGiS6A2KnEACF
gSBYbCde8BWaFVlVyQUPukEixEuJQzu/p/r6k2nVtJnLxi7VfMKXc6/mw7FhzL93
y1WzFIgrQb6pQXvr72XtpZ9HjCYIv8FGuQ4g1okEK0SNUjnh/RqRXzWv/9mDnwPl
shAQhGs/ipxbOmMy1UZKt1gt6HUaHm+HrOuwOthSdEMq0rXoDRhAfi6Ix/Wr7IBs
FGm3HRCxHgAjGpocQFfdqeHUNW6jduwCVMXIROhLO2Ou96aLUGYcIxrMlxwwWubv
LNIzIqG3kjBKpTp9UNOIdDbEIiYONdkF/51+UfZ353EW2nFl1PUS8ApbR2OHUHn9
KRNwBWdkmGAEoZ7HbwitI40UVx/HQwctTm0+QvGe6b+KsYzh7xtI3XXMNOzr9egr
yxdu4vOWT1qsXb0ZFIRaeVZWaFFP/fq+ZZnzPUnRSAWs989c1q/XLIF3P6UiqnrB
ym0hb8vJTRDOpQJMGUTD7NR7+vGltehRorim9Y1vyr6jwkgyoIgP2fp9JH4FjLm8
dM69q0tCT2x44j60d1uaKZ8zb8XR1IeI/Bw1d4PtnApWY2I9kZyQCPDwumhyPfD1
KKfq/1H3XrGCMFGSodP6JWQGIYMUZiPE1kPtZvEDYtdCqMNMoxDUaGJRNtmBlKXL
yFXhAGz3gUshzZgt+xm4AzCwKMcBmlY5dDzlUa/Aws0pSGFyYWxkIExpbmRlbiAo
VW5pKSA8aGxpbmRlbkBtYWlsLnVwYi5kZT7CwXcEEwEKACEFAlTbtV8CGwMFCwkI
BwMFFQoJCAsFFgIDAQACHgECF4AACgkQXU6bABokugNfzA/9GFNtG39PgETkNDt1
Tghf3dL7ATakOiSgtny7HJA7Z6Qa8c/XurY5C9LcbyQttoMUmHMsHLj4t/Z25Qe5
8SLFjiTiBEtm5AcEtCt22PMdOTlldOtnxHTFgEH0YSrQk0x1ERrlI0CcY3KzGWN9
mg/AbqAaGxP9qDfKZ4rvuafCUj7KuAEPZ8+6mu93180C4TME0ALkY+p3STwYb4hl
vsmWeVg5SapIW9bWplxWLqvwjkkKtnfmXRSmMt+laXHtpWYaWA9HbL+dWNbPZaXs
lbBs983DRjmRGm9I/NH29X5zsEuvbk9R1NvebHea92BDjs8xsx5aj2lYOwODu590
35al1eW+BEDRYs4OY/yVOYtgKKGKimABn6j7eEmny/c3TBvC4UBk0lLMM5oXmqso
st0ekiuTlb6PgHabzxgm1fPvzDCNxKc/hjCS4fwTiY87/OpoVoYqcCVTWGIaJtYd
jAhi7QsafrLEqtiW9u05of2d5az+RlWruXYCCOISvlLTq0qjxgfuGDqKPt4wvhtY
slJfJDDRIf4l+o9SP9/enboZJ+9S+73d4gcCRZ2zrIOMhjhvsQH1y63eRk2S3lWj
alN9shXku0GS+W+eZKploksNrs58JZpeohMq9DIqRLMQdgQq3nD0h9m9dn3h5JdU
PwUis7c7+i2X/wVnD9CnhllYW9nNKEhhcmFsZCBMaW5kZW4gPGhhcmFsZC5saW5k
ZW5AdGhlbG93Lm5ldD7CwXcEEwEKACEFAlTbtUYCGwMFCwkIBwMFFQoJCAsFFgID
AQACHgECF4AACgkQXU6bABokugNCMA//b3admehxD22w5i1ssML/vxLrxyIgs2Co
GAIjPkkFUzLTURaW3ZOL+zqcIRhvJWu5vnY/pRyJ5jT970U7pUerKjvM7JY5f1a8
XaprhQD9l/srJAkO8hdWlfF8wNsn3bP9z3p41kzOuoxCuC2lTcTWCT/Qus0Rp4jy
h0BmVIkpT5ZtSagRTFYgXHxNCPezXavjOAR91Z9eYFbvs6PcOj1a1se/ZLTFg0y7
fhMe0Pk1iI+OPtg6C/MLaKN+eKbs4tOnMgpwT7LaUZsBLMCHGNOH43HUOG7872Nw
qCkzURozsd3VtQjIWXjkBcMwfeTxYjy5LA2dHEdB8O1hJE/i+sdvcTtspBO7ISEo
GM0LQD1AzqfaolNEYgDjMQTPTykwjSTC1G/0Mh7GsP/M746WNP0fZ84TkQrrokEb
P9goBHWNsStOohVoMqPSk9drcCEkQxZDNPdpUBBfRBPL/ErQDPcr8s0mDs2riahU
Mfuxa97Rlp+09yGCXD1el8UuFgzeQ8qXKxo9/g57ysuARw70ztl3Av7Xe2/j//lr
5PK/i8hd6hewjFGRuIffMnRZrvtp24MZJR1t0VSFXCrhZRmq9k6xDLZ+LIDR/Nez
dQUbvZc34bWakEbVgrHiP0ZJuqQnc4o8V5NPMegLLUqZVNKfpF4YYNgAWd10vuvp
1e3kOwSo1DzNIUhhcmFsZCBMaW5kZW4gPGhhcmFsZEAyLjcxODMub3JnPsLBdwQT
AQoAIQUCVNvD/wIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRBdTpsAGiS6
A/wuEACxPLKkGJ2HhtykmH4G+iVbJ0aK79HJU3fxE5b9Z6j/iR6VNfe9IZCSvrdh
oVmk0lA1I1cHGmx5B82ptDPYUy26sc/W0ov1q0iAS4TzCRTruLoWZ+tnaulSNvFc
TiNcg4uD28VxwLjeg87gad+3KH4SKHiFprinjboOWgdrfjh992HA+g1czDDLiH62
u2xm78mKW/ykNyfs3ADfgzGwPW2a3C5+mIbp7ii5MvDcbr15WcqN57WGogSWWDZI
AN6unIhpq7+c1ZUa+JkhuHt3aH3YX+uzt+5L1+IzW4qBSh2C00rCyhLfA4CXcBIx
hGvYv+QLF/xh6ka7u7zseVkX3njgkDm22E6iSTQfnsRy2xs+Db/3R27ih0VfDbdo
uDX+l0py84kIYZTMP0OyrBNb5WXjk7L3Kf5M+p4QPrcr0lFuLxmzolHs9lHbH546
KNMr9XW58QgCAmeeymEgGtuQ7KF1cu5oDBmixAJR0AcF38bgHfdwQ189t7Y64e2j
4n7E5vnT9DoaVEAaTxFMRlcPzdVyuelGxRUE+WtLwUOPASyjegNnqDr7K5hSluPD
7H5k6YPwH00cjbtE3pfUbzTYd8K0gSP1s4yvFaidF0gAkRYRql5j3Fiq9MIEs/Qn
REb16eXPcjM2P3CLv/uz2qAf/8g8Lc3M43y4VDpD7QFdoPcmN80hSGFyYWxkIExp
bmRlbiA8bGluZGVuQGNpay51cGIuZGU+wsF5BBMBCAAjBQJW6dxFAhsDBwsJCAcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQXU6bABokugMxDQ//UKptM/zVSEDbdTv6
94V2//LHW+IHAYK7TgUzdAF5D30IVLI6KuLXkMt5EVDASffeWLk/yZRO/5BRwytJ
ODNjfM0N5x6FkMApeqKUSccYQZpV6DrmSz6GJPHEY4WXljJkHKz7gTI5Cj7ppnrj
dhXm93gCQKmSjjh5VmN4AyZdoO22rZxWDw5OEMfvLgzB/EUDdHAyt7KuLHd187e8
8X14PT9RbTr1UnDnpclXBtnCcKQ577aud08BY9RL8FPjNDFTyIsNzn7F4Ww+kT/C
dI6Fu1cMYaiQreshQ1SGEYYTV9Fy+NJUz9JpCMFfTXztqXt9cGRSE2z2eCS7CCJ2
gU3M8a37+XwNqTnqPw0K0khPTDBdT32qOmIifeHEfeJ15+oe+eixjIKZXfTBu2qB
t6beY7wbbNknxuNaNiZ1EyxBRa/jRc+wA3pW9kBW4p/0kObG1F21b44SXdXt7n6P
j0dWgwHtBIABHdSJeOFqMcT6En1jSHZQiMbQRmIgUGGv+knzquXL8c5hYERzNiMs
N/tEqddtT/T7n0X6+Dt6cu2M9qqjVBdz4f9bvyGN4WmdjUc0238CcOepQZuPLlIg
nDEV081Pq+MKcoXkEMbva/kXbrmVlY7TDPgFsgKZb9puhj+YX10elKZRMZp9mmy0
jD6xQl8zcEaWjs+Zmw4q8eCG28bOwU0EVNt7xAEQANP4GPkUhtFH1zfAUf6YxMmb
k3Iiha08e/+zEC8rpCBkDP6UehOhYscdgTM5LdKa4RA/WSkjQZ8dZu4MWoAQGs28
qq+NEeVGd+7xYxggaSjxpJpj0wlhHZ7dWmWNLxO0Ay67sFKTHdw1gzLq/pfe80ya
ptCxsWv7oWp7nmV2pbdAztVesZKPW9BV/XscSbfd/4bpPeJ/UR4LDr3k8EqbNSQG
9wK4jPZ3ohnGWbmdXGPX+gxT6IEp/kpOp0d3yKoLXXNarpM92nLT43aC9hor/rqJ
FkweSibrX4m+bPSUO0rAFH4zKCNjpHlrDywiJ0ztK53qwUmqcCCJTPHyhjx3n1SB
esHuNnMVZ+O04N3oCSS04jbIMTMldIFEZVQ8pWRL7GnUt1YtQrHJaL1mgcCj81sS
a/2htv0m/C9AxhmeNC4c5xoUwErxi3akqrdU7xmQQtqQRGZoi/WVHBlzGQaXDdLj
bofvB4b3XLzRt/MSqWDU+hyb/oNISEdyQLxvAIcoyL77I3ErI6Ev1/LEdwq4BDI7
HkIeAb4Ylme7KOVfIKYBdVtPXCRuN77O3upQq2E0wgZmR9GBDJQSq7TI86Q5hMK6
lkzs2GNqWhJ0EBjNewmaq8iqNWlZ0KHDFXeh7S7AyUl7kZEeR6xjD2cAcXVKF3Kc
lNjvOXpkIl1AI/g108NPABEBAAHCwV8EGAEKAAkFAlTbe8QCGwwACgkQXU6bABok
ugMJUxAAxBJK90rmrsqvQ4szcjp/+7LA0BhWLbwNdWrGni7W9SJIq4ZPocvqXBR7
hDGctTwzTmsGlKSr9fSA5vKEhXvnc8sYLj81GKwMGsBLdvVacuoFxsBt0hnEdBIv
yuh3k73fbr/YVbQxQ4J5WmEGIS+HBYAkmgtsupZVKi5/AaB4wzNFSrQzGtsbYPwd
E0AKcrRegXrFfaXJWdU8FhNQktQ6JKkIHTCf0H8nb2DwOTaH595EDAfjhyuHtrvC
VPI8E/gPH4X3gick3POUzdu7qlPOk6158qz43q5cQ+GtLChSppSZv09RLnd1llD4
ePBtCB3O4aSTcT+B+snxVKW1YXMpS1FmPOL/o0KEHqTLC5BnupzybMbHvE/Iu/SP
MAdtFMFIcOHEdUFOwWYboeeKet7i/EEWWNOzr1NAoQXIoX3V/xb6QGsbZjMu5w3h
MNwcfOaXmo/gYX/qJGukDJkBCiIX0aKtnYslOCXGpNnT8Wfg6ynd6lmDMjUVOCtA
LlChMj5B3Q9dTGKM8CNbVSpbJgW7snm98F4mxg6HVZy8DH56Lo8fajtXr9x9fwti
1ppNl6xFQkXaZyVdxtOPbuBryc3HSnRYyJTT4DB+GLcm7JSQ9a11+oJlPAQ1qSoJ
iN91wqay7avFjt3gtO9ZQK3HSuelglIgUT6jWRojsim6GrJ83aM=3D
=3DQgvl
-----END PGP PUBLIC KEY BLOCK-----

--------------3SCJ1qo4SETPcucEjqzzknba--

--------------t9U9joqyIcFy3MaQ0fDVX4Kj--

--------------KElI5G8JJavXDQFgL5k6AU09
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEFJW8MZyAHZHmVTWiXU6bABokugMFAmW84N0FAwAAAAAACgkQXU6bABokugMR
yQ//UmyZ7txecZHQIH7I+m2wHcOXTyXIIYf2BJV+LlnXRXZdSU0yFTJ11oDkZW/vUU8Xt4EsrI63
+pX3h7ZXauLvM6F1+OINCE7l2XLvpOxlzcpTQhof4lwUghU4+XSqAcHXSf1yvxcxy3ZSg9acoWR3
kPWB+8ILTO+Un6aMM7gOLH3wUYM0TCucGA7o+CiXKOZDxEXqRvYs4ZgHPGAmaL6dGepHNZ4L+/GE
E4y55GDKdImHeBqYoR3sNUaNEx9oCcarDVcx8M0nJ3naEvEt0XFnOY0FWhjNS/5W1TSfKxRDaueQ
1LcUO+QuawDsYKy3lak96GOjq3j7bvulsccr3wSmS3FScz0jVYLkq69glKNCl8RxJdVT4NJ83tbF
g2K2ecqauD4Knn2fVrY99xJWsEWiLBR8wM9xOBbyVwdtFLi5UNT4l3BrX5Io8ICPnZ+xgOR0P8oN
y+AeA//iBsWtTpkzHs6SKwwQPwl++ckE5+1QUgwIsKE3WD6rALOKk3X+DuOnBw5ibrHJxN13K4wf
sZcPa1p68I6ZKJ5z/gL9kCmAPwZ+EpPe2zoy4ZcDd4DC0IULJDvoh1pDOr/7HPyugA4rpSGOCb/s
rxiuLsTX4LabmbllEDGTq7mAZPhmwjalh43/DJEvXbSKBab9UUsANfvo11QUaVFiDAulVVlOtCh6
4hQ=
=i6Fu
-----END PGP SIGNATURE-----

--------------KElI5G8JJavXDQFgL5k6AU09--

