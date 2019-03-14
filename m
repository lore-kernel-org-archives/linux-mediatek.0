From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in spi-mt7621.c
Date: Thu, 14 Mar 2019 13:36:11 +1100
Message-ID: <87mulyp4h0.fsf@notabene.neil.brown.name>
References: <20190313122403.248873-1-armax@google.com> <eb85ea17-babd-fe3a-f0ff-9c7f13498bd1@gmail.com> <CAJsYDVKF-3jZo4E3EMiYOqeWXVLu0hBra6Qp0sFoCz8y=BAjSw@mail.gmail.com> <4789d739-d2b5-357b-b9d8-bfaf587d33fc@gmail.com> <4172ce05-8dfc-c956-6af0-47c8367c215e@denx.de> <87y35ipgkt.fsf@notabene.neil.brown.name> <CAJsYDVKwJZmaLMkzYOeGnhnor7rXe21Xwvogx7aPfzfXOdqZAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJsYDVKwJZmaLMkzYOeGnhnor7rXe21Xwvogx7aPfzfXOdqZAg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>
Cc: John Crispin <john@phrozen.org>, Stefan Roese <sr@denx.de>, Matthias Brugger <matthias.bgg@gmail.com>, Armando Miraglia <arma2ff0@gmail.com>, Armando Miraglia <armax@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sankalpnegi2310@gmail.com, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain

On Thu, Mar 14 2019, Chuanhong Guo wrote:

> Hi!
> On Thu, Mar 14, 2019 at 6:14 AM NeilBrown <neil@brown.name> wrote:
>>
>> [...]
>> My only small concern is that this driver was backported to openwrt
>> (4.14 based) and then reverted
>>
>> https://github.com/openwrt/openwrt/commit/749a29f76ca780d8df70a5163d43bbdc6f13ba3f
>>
>>  "This breaks some mt7621 devices."
>>
>> Possibly it was backported badly, or possibly there is a problem.
> Last time I backported the version with broken SPI modes so it got
> broken SPI CS1 support. There is one mt7621 router using SPI CS1 in
> OpenWrt and the backported driver broke it.
> It has been fixed by my two "drop broken spi modes" patches.

Ahh, thanks for the clarification.  Good to know all known problems are
fixed.

Thanks,
NeilBrown


>>
>> John: do you have any more details of the problem other than what is in
>> the commit message?
>>
>> Thanks,
>> NeilBrown
>
> Regards,
> Chuanhong Guo

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlyJvhwACgkQOeye3VZi
gbnSyg/6A4cJK3Y6QVKHque374sHdHn+JkGuuP2+lNs/SQMknyXuHJiOQVWuJFh3
YthVDHhRodQM87ilVji48sJQEZoXkwC2mvglabGxL9ior1qGUYE01R3qp5OTcvZ9
UrMOJNILFKvfRh/u0ZcjntPj7DodjvkBFbJaWP96/PZQrrAMvjFlkYOVw/Bpnz8O
sZR8dkp7jytaX10hnEgLM/vvE98j0igoY8dOXIgd45ZY28tHpRfRxVFvUZfeOtfD
OcyaqtICFJaMcQOC1Ehfl/haems1rxNCaiJnQ/7ZJRpzz/pY16H7I9V1JxdS6oti
zwLbhp7qQHtyRxYAdlAUE6H4krLYC/EsJVIgOdMZyVTKEIdF5FAmTnibnoz5LMOW
RHVXRa93tgpKiANfM1suxjIA04HnpfSBwaCz/xmYOWjhRc5tkwYO57AaEdZA3AsQ
b1vD68vQCqMTrP5KtbQNFGih0upuQG+7xHUVHLHBgTy4zMgzHofEodSHjSxaiY2U
XLwcba3M92hO7z023P3vtLlgUhtOGsyJ1SFw/SxBaTUiv91kgQ5Kpg2FI5rxywXi
LYO7k+u2p1Y9MD5iOFUHSMabselNGPIZ3hGSRUehtK0tlowelR1UU6sc2r0Nw+JM
3Mttp/kKuoYjC5l57kHzUWo8hjoOniCPFBn49O6tm5EI8wgOSww=
=HXHg
-----END PGP SIGNATURE-----
--=-=-=--
